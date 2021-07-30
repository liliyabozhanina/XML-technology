let mapLayer = new ol.layer.Tile({
    source: new ol.source.OSM()
});

let facultiesSource = new ol.source.Vector({
    url: 'maps/faculties.kml',
    format: new ol.format.KML({
        defaultStyle: [
            getFacultiesStyle()
        ]
    })
});
let facultiesLayer = new ol.layer.Vector({
    source: facultiesSource
});

let map = new ol.Map({
    target: 'map',
    layers: [mapLayer, facultiesLayer],
    view: new ol.View({
        center: ol.proj.fromLonLat([23.3217583, 42.697128]),
        zoom: 12
    })
});

facultiesSource.once('change', event => {
    if (facultiesSource.getState() === 'ready') {
        let faculties = facultiesSource.getFeatures();

        if (faculties.length > 0) {
            addFacultiesOptions(faculties);

            map.getView().fit(facultiesSource.getExtent(), map.getSize());
        }
    }
});

function addFacultiesOptions(faculties) {
    let facultiesSelect = document.getElementById("facultiesSelect");

    for (let i in faculties) {
        let facultyOption = document.createElement("option");
        facultyOption.text = faculties[i].get('name');
        facultyOption.value = i;

        facultiesSelect.add(facultyOption);
    }

    facultiesSelect.onchange = event => {
        let selectedIndex = event.target.value;
        let selectedFaculty = faculties[selectedIndex];

        updateFacultyInfo(selectedFaculty);
    };
}

function updateFacultyInfo(selectedFaculty) {
    clearFacultyDescription();

    map.getView().setCenter(selectedFaculty.getGeometry().getCoordinates());
    map.getView().setZoom(17);
    let facultyAddress = selectedFaculty.get('address');
    if (facultyAddress) {
        setFacultyDescription(facultyAddress);
    }
}

function clearFacultyDescription() {
    let facultyInfo = document.getElementById("facultyInfo");
    facultyInfo.innerHTML = '';
    facultyInfo.style.display = 'none';
}

function setFacultyDescription(description) {
    let facultyInfo = document.getElementById("facultyInfo");

    facultyInfo.textContent = description;
    facultyInfo.style.display = 'block';
}

function getFacultiesStyle() {

    return new ol.style.Style({
        text: new ol.style.Text({
            fill: new ol.style.Fill({color: 'green'}),
            stroke: new ol.style.Stroke({color: 'white', width: 5}),
        }),
        image: new ol.style.Icon({src: 'images/grn-circle.png', scale: 0.5})
    });
}
