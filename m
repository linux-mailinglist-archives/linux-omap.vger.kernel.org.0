Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD27216A23
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 12:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgGGKXk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 06:23:40 -0400
Received: from mail-eopbgr1300044.outbound.protection.outlook.com ([40.107.130.44]:18876
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727096AbgGGKXi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 06:23:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRWQ8pql45feMgFMZNMkEF1xP5CwZplp3M2ZgIm7+Im7DF5bdXfQBorrNMbSyQ1lSaWXUbU+CuxIyZqTTwPdX9zQhj/S+HSP7o/Nir0Z7IamREtERW32YVzAc5TSVJwqXI544YRV/IZhkFqplxFMjJcQHd5JWU601W7fq7bVfeyxlCEhdoBdrYKazNK3FV/DvOuR7oLQfZ4RniLYMMpLlh9QQmNIXgU7Fg4l5mVDSEHNTCv/JK2RHPt67TM3qF2kOlkgDUkExlXErI9DdCB5P4VOBvADqUWo0GP70LGouzVCP7ju5BtweJrlC6V0SOe25LWIt49+B1lP87Tatp380Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3J9UGmPr/LQeQFAHRDrIRgmtcKcshwF1dgbubnqTSc=;
 b=WxNLi4Ah5RAIwkWrr5hW46VP60flGEzCv/vn9ZO5YUPAyHdrP1I7tcpSmimPZBpWEjXlJ/LIi8bJAYFcQ3dCFVfFkehY/ZqiY++Oqo0xRugg1CZxooF8BhfEk5SQ+OIwEJOq7ltRtg2tKfg0mAf0X0+ML/I8HQOccd+wXZZCJJQloNjRRnF/z0XovWcKvEqR4QYgQkY53DiECI8MChFmxXfvg8HGijsgKTgWtcCWQsr3OF+DVUoDO8EHmljLRdbasi2ZhMTJGk7E08XA4Moh+gMZiHRrTnNQ0rA9R/ORJlGEHWfllZ31A5CBQkmL1xUDX/hHGzP8HwKhM9WQRDywoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3J9UGmPr/LQeQFAHRDrIRgmtcKcshwF1dgbubnqTSc=;
 b=Jqp21TS/Uj5ILaRVVPkeRT+/pVpZEFfPUNB1cU/n4WHGw2ug+cL3kl/JLmxGOZL4isgCDwkJ9Ey5IKkYDkJWgPMScqXs7IP4UnKykTYbm/8tAChB+wxu6J3ISa0LBOBxEv8XkQW7yeSEAEuE4mJ0PTEnOwYuUl5Zryt6MsjnxnA=
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 (2603:1096:202:22::12) by HKAPR01MB3650.apcprd01.prod.exchangelabs.com
 (2603:1096:203:d6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Tue, 7 Jul
 2020 10:23:34 +0000
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77]) by HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77%4]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 10:23:34 +0000
From:   =?utf-8?B?Sm9obnNvbiBDSCBDaGVuICjpmbPmmK3li7Mp?= 
        <JohnsonCH.Chen@moxa.com>
To:     =?utf-8?B?QmVub8OudCBDb3Vzc29u?= <bcousson@baylibre.com>,
        "tony@atomide.com" <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: arm: omap: Replace UC-8100-ME-T with
  UC-8100A-ME
Thread-Topic: [PATCH 1/2] dt-bindings: arm: omap: Replace UC-8100-ME-T with
  UC-8100A-ME
Thread-Index: AQHWVEf5S/LkqytVQUufJNKZU4U+ZA==
Date:   Tue, 7 Jul 2020 10:23:34 +0000
Message-ID: <HK2PR01MB3281AFFC8F352E3AE8046645FA660@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [123.51.145.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d328802-2716-40be-764e-08d8225fcdd1
x-ms-traffictypediagnostic: HKAPR01MB3650:
x-microsoft-antispam-prvs: <HKAPR01MB3650032932A71FE76392F77CFA660@HKAPR01MB3650.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:173;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UjKKxNHRf+9Hvp444V018yKJweAx8ulGLqtG59RwfESOXOAi5A8hNfNhNaCmljJ3AnCnWvn2/8EdsW/bl3cv6pmR5TpGWTq+ceBV4wKnylqSLvJDGG+/b+ZEAlEnxeLFBo2Y4YrWKSugNKj25Vts8Em/Ct/tlnhNVgewuqx5vaPVGyI9bGX1+Yew5ydF4C8ePemayLq0VG6/t5hw959SvFCBrwu1kShbXCasBVwlE+6kBfXElMV4ilUe4oZ5Xu++71yJPkw7MU42jng+kZVLXlXNr7Llv4M/vwbmHq3R0lbIRBLyGOb+Me+bhyfKro6ZH8zm2FAbc3Yi6scampUVWQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR01MB3281.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39850400004)(346002)(366004)(376002)(66946007)(478600001)(2906002)(71200400001)(86362001)(8676002)(5660300002)(55016002)(83380400001)(26005)(6506007)(9686003)(186003)(76116006)(66556008)(64756008)(66446008)(7696005)(52536014)(8936002)(66476007)(33656002)(316002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: nCVU7yVnxlAtJrjKONQZ4XIjEm9tMnnxhc3hEaf2V+hITs/RYY02GfZMwgp4SE+MCFcOVZzRBJAeHs2WAXqhhTccKmpE5nnJgsdbAlWLuX56a/Db1AWIK3fZz0fsBtOWjhCs8p+R8/fQqiOp/RTgz6oIJEI72scD/f4unA7iaFYKHSPP8lBBRn9+sOvHgrBgjOqElAPVr7IheSayJ8jurEkJGtJSthXdeRtYZw7oNTJrxF2yRPWE7rnbrCWPPT7E78HUD4fx0Rdc8hCAPA4bZ4spaneAOFoEnZaLpG+S0U7YIQANHg4zPfIAO7t+seY1jjzv8yhshDxFW8bG7hpVKVR1hByGYmSxTm+xOy4wHLd3giMapLr4KJjfRgL3FeY2VHG6rOVxR1fQ/3C1roUlYihAY6i2lBd8QAGQSl+v500R+Vc/03+q3L/HY+mElrb3/1kAmc4wuZqEXA2iu5ffrcPaXZx8e7XgYNoHrPhtdiY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR01MB3281.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d328802-2716-40be-764e-08d8225fcdd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 10:23:34.1140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYFlWKqV7OSc2ucTMdBIhyrW0sSI3z6se0LD+od8U4xihk1x4oVII22zAro1EV28v3ZExp734uxNIMk+Q3mx+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR01MB3650
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

VUMtODEwMC1NRS1UIGlzIGRlcHJlY2F0ZWQsIGFuZCBVQy04MTAwQS1NRSBpcyBhZHZhbmNlZCBv
ZiBVQy04MTAwLU1FLVQsCnNvIHJlcGxhY2UgVUMtODEwMC1NRS1UIHdpdGggVUMtODEwMEEtTUUu
CgpTaWduZWQtb2ZmLWJ5OiBKb2huc29uIENoZW4gPGpvaG5zb25jaC5jaGVuQG1veGEuY29tPgot
LS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vb21hcC9vbWFwLnR4dCB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL29tYXAv
b21hcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL29tYXAvb21h
cC50eHQKaW5kZXggZTc3NjM1YzU0MjJjLi5mMDIyNjVhOGEwZDQgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vb21hcC9vbWFwLnR4dAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL29tYXAvb21hcC50eHQKQEAgLTE2Nyw4
ICsxNjcsOCBAQCBCb2FyZHMgKGluY29tcGxldGUgbGlzdCBvZiBleGFtcGxlcyk6CiAtIEFNMzM1
eCBwaHlCT0FSRC1SRUdPUjogU2luZ2xlIEJvYXJkIENvbXB1dGVyCiAgIGNvbXBhdGlibGUgPSAi
cGh5dGVjLGFtMzM1eC1yZWdvciIsICJwaHl0ZWMsYW0zMzV4LXBoeWNvcmUtc29tIiwgInRpLGFt
MzN4eCIKIAotLSBBTTMzNVggVUMtODEwMC1NRS1UOiBDb21tdW5pY2F0aW9uLWNlbnRyaWMgaW5k
dXN0cmlhbCBjb21wdXRpbmcgcGxhdGZvcm0KLSAgY29tcGF0aWJsZSA9ICJtb3hhLHVjLTgxMDAt
bWUtdCIsICJ0aSxhbTMzeHgiOworLSBBTTMzNVggVUMtODEwMEEtTUU6IENvbW11bmljYXRpb24t
Y2VudHJpYyBpbmR1c3RyaWFsIGNvbXB1dGluZyBwbGF0Zm9ybQorICBjb21wYXRpYmxlID0gIm1v
eGEsdWMtODEwMGEtbWUiLCAidGksYW0zM3h4IjsKIAogLSBPTUFQNSBFVk0gOiBFdmFsdWF0aW9u
IE1vZHVsZQogICBjb21wYXRpYmxlID0gInRpLG9tYXA1LWV2bSIsICJ0aSxvbWFwNSIKLS0gCjIu
MTEuMAo=
