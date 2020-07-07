Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63093216A1D
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 12:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgGGKXg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 06:23:36 -0400
Received: from mail-eopbgr1300044.outbound.protection.outlook.com ([40.107.130.44]:18876
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726879AbgGGKXf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 06:23:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHuPCp4d3kuHraBt3gLeY1MWgdGyKgQZeH6j88XSI+cNSD6zml+NGXl9DRXcxWV5hBRr7yeRtsOyZcY+fS/9sdfMGWTUQ0UFziYNX+wj0AXmQ44JevNfOYLzWi6bRrQL8VS+mxNe7g38/hsOtQ5eAltmLo6A15V51agqvuBANqrXJm+mFoHUi/H4u6bkBaEL6w2i9gQZBLWuzUOTxalyB1+5nhQ1YAebDA3V3Z2mPsOeICjjO5YaSYx8StOE1mku6HfjYGjsP+28EW2fYxY+i88rOebdxmSsrf1jKUIp1ZHnNCVszPDuW15pmesnNTvAVhaopvk1/PctW3VELZrZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+b6451515xEzZjMxXjD9j85TfBmXAxEmr5wltmRDxI=;
 b=UP1KZg0LwJBmK5QgwRR+7GrWJVFiWHa+YgAAp/8UGtgpsm5lIJMizUTEUwpAS8B21OTUyZPLuIcknvcHbLvdV358R5f0yyG+a+RNVfg49f+jmICgC74zhdyCoYo3QBs/l1cFTBrZpATFPzcHyUsWqUGKwKyPKLBPBlwyuXTk3VjwhqJveHtZoH8zcgXFnttF3t5X1c0kpCls0hwwaLwdC5RFxXhBcVEh71sFr2OLEdn1tl/kZHLLuS6g9DCs49ijr7SjorqF9+/PzpWBwFzVjGXduNarmoH0Yy/jqo9YiYSBUQj1JgeGt0hiX29CrLpvf7BjHpaBUvN3rg50xCezoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+b6451515xEzZjMxXjD9j85TfBmXAxEmr5wltmRDxI=;
 b=EXlPUk05zZ78xIKzFHES+FiAUNe8UD0rI0bk1m7cnTL5iDs7Pynfr4g7VR1CIjOZ2Uq4ybE9+xccpCkLEz6aatvvRal12GvqiYHuClUwA19sS8LSK4/R+fskqtrIpo7qJ7im3x4do2mFE5AT2HIC9oxuQlgjvCuadIgqeAb8hHM=
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 (2603:1096:202:22::12) by HKAPR01MB3650.apcprd01.prod.exchangelabs.com
 (2603:1096:203:d6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Tue, 7 Jul
 2020 10:23:31 +0000
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77]) by HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77%4]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 10:23:31 +0000
From:   =?utf-8?B?Sm9obnNvbiBDSCBDaGVuICjpmbPmmK3li7Mp?= 
        <JohnsonCH.Chen@moxa.com>
To:     =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        "tony@atomide.com" <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Add support for Moxa UC-8100A-ME open platform
Thread-Topic: [PATCH 0/2] Add support for Moxa UC-8100A-ME open platform
Thread-Index: AQHWVEfbcD8xIBxUWUmnB1PUkm01mQ==
Date:   Tue, 7 Jul 2020 10:23:31 +0000
Message-ID: <HK2PR01MB3281876EC1F9FBC5FCE94954FA660@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [123.51.145.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 651b4efa-a04e-4230-0bf8-08d8225fcc4d
x-ms-traffictypediagnostic: HKAPR01MB3650:
x-microsoft-antispam-prvs: <HKAPR01MB3650648F39FDCE0063D80CFAFA660@HKAPR01MB3650.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uHlhO6qVVyH41p4nXpkl+NbMWGU7QrLMrEUjvRhiRUhFhaPevGHiz57pSnN6QJqDCqNEXlYO0ki1sJ4es0aiiAQAeYCvp8J5ht2IvhZfd43ziIyBlO0siHsKJtCdcfZL56l6C9rbSZIoLE9JUSazBNW2CGPF3bscM123v1QkzQ2dxJ3pfsl0eCY6x32suTuei3JZ0180Y1jCUkc16smrdFugEx/yR5G/ltULammUW1vvxIfrE5zUWRweEE1M5NlG+WEsmctD9iGBbXREaeQzFSF++y3G4F75bpkXTu/4X9hSqbIciyRVOc3H6+o+xma3r/TJpitWUjcBOKkgTbrwGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR01MB3281.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39850400004)(346002)(366004)(376002)(66946007)(478600001)(2906002)(4744005)(71200400001)(86362001)(8676002)(5660300002)(55016002)(83380400001)(26005)(6506007)(9686003)(186003)(76116006)(66556008)(64756008)(66446008)(7696005)(52536014)(8936002)(66476007)(33656002)(316002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: pmHntXh20ucr9mGsgL03Z8FcayFCOMQwMBvaZEp3DA36+lPtvYJh/L6mzDUnib84szP4VNt6qtJNWp33FmyopMXTEOcGIZzqZ48djapMZWErYZ75PUdNe8FJ8ZEStcoPqe5yvlklbU6stb32ROD/M1LIgFGArXI77gX8GyYrjE9WgsSnM0vRA9QH6TaVW8yzuYv7vxP/eWUx6yn3B7VDZ6aVkgJTQnR8cwpJaOy3KfP019o+Sfr1yuwwYt025N3N7a7jb3bs5tD1VxAv6jFgH8oGbexh1Osk6mUkq0l1fILAA+HVAx1l6B7BdC+CWS19evQ/qJTb9jGZC1ekrTkcsyt9zs41XEgZ9L0BiTCR8YZ+5+Bbt9USAteYY3sJaAhr9VCdDm21Fky09u9x8eOajEOIHJAYfeajP91Rh4P4Utjxvf0ggKj6Lmbr3/idqXmPFaF0tRhaC8AQLDrTaHJcelZTdFfxBa0pxAT/XxvwN8c=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR01MB3281.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651b4efa-a04e-4230-0bf8-08d8225fcc4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 10:23:31.6504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E/pUAtoF/s0A/99osC1FgfnOXAB0fxjL5WzfnalJJhQxmZcPOtiGsgDTYGaafmcsSV3ZrRo0+T+lthGh10m17w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR01MB3650
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGVsbG8gYWxsLAoKVUMtODEwMEEtTUUgaXMgYWR2YW5jZWQgb2YgVUMtODEwMC1NRS1ULCBhbmQg
VUMtODEwMC1NRS1UIGlzIGRlcHJlY2F0ZWQuCgpVQy04MTAwQS1NRSBwcm92aWRlcyBsYXJnZXIg
UkFNIGFuZCBlTU1DLCBiZXR0ZXIgaW5wdXQgY3VycmVudCB0aGFuClVDLTgxMDAtTUUtVCdzLCBh
bmQgaXQgc3VwcG9ydHMgc2VsZWN0YWJsZSBMVEUgbW9kdWxlIGZvciBVUy9FVS9BUEFDLgoKMS4g
UmVwbGFjZSBVQy04MTAwLU1FLVQgd2l0aCBVQy04MTAwQS1NRSBmb3IgZHQtYmluZGluZ3MKMi4g
YWRkIGR0cyBzdXBwb3J0IGZvciBNb3hhIFVDLTgxMDBBLU1FIG9wZW4gcGxhdGZvcm0KClRoYW5r
cywKSm9obnNvbgoKSm9obnNvbiBDaGVuICgyKToKICBkdC1iaW5kaW5nczogYXJtOiBvbWFwOiBS
ZXBsYWNlIFVDLTgxMDAtTUUtVCB3aXRoIFVDLTgxMDBBLU1FCiAgQVJNOiBkdHM6IGFtMzM1eDog
YWRkIHN1cHBvcnQgZm9yIE1veGEgVUMtODEwMEEtTUUgb3BlbiBwbGF0Zm9ybQoKIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9vbWFwL29tYXAudHh0ICAgICAgICAgIHwgIDQgKy0KIGFyY2gv
YXJtL2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIC4u
LmMtODEwMC1tZS10LmR0cyA9PiBhbTMzNXgtbW94YS11Yy04MTAwYS1tZS5kdHN9IHwgNTYgKysr
KysrKysrKy0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAz
MyBkZWxldGlvbnMoLSkKIHJlbmFtZSBhcmNoL2FybS9ib290L2R0cy97YW0zMzV4LW1veGEtdWMt
ODEwMC1tZS10LmR0cyA9PiBhbTMzNXgtbW94YS11Yy04MTAwYS1tZS5kdHN9ICg5MyUpCgotLSAK
Mi4xMS4wCg==
