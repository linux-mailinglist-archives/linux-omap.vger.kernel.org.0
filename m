Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCE56F537D
	for <lists+linux-omap@lfdr.de>; Wed,  3 May 2023 10:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjECIkU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 3 May 2023 04:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbjECIjz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 3 May 2023 04:39:55 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C085B9C
        for <linux-omap@vger.kernel.org>; Wed,  3 May 2023 01:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBu8dDSZ7UuaPMhz09N3MKY/rsToGXKHzU92tt0YnE6U+J0fJl18UxPO9VghYzNZU1BqElUZA4+V6oLD4XktaaX7egg7u6uVi4YQSRLF7gDwEf9qVBiTfMxyDcMP5aQmmy/4jpHWXhtdIWVOgKy99LkC8/X7vWsB/6cjA/51zBPbseg1dfI/reSke4cNlr00N/CdMQrVFuqf32wlN84RTU4RGD3q2N2LNPD43atIXA0Sz4DyiCNrlcvFc2Nntljss2mJ+e6cA4RvbyXwe6EG+NaTO/ZYr46xTXgfq6DhRjNt2DhkN80KzSfv5ylQZ/Sovn7907+Q7iYZR0ElNq61qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0fSh2PWRxKwA2Nlx5oKBk7TYF+XqVXZPYWlNhj9hts=;
 b=hamGrXM6l0/UXcpZcLsxjfQwQNo1+VcIakOCb0VLIfBbcz1UEZyKKPPOB4XKJleZTGyJ9VT+7UTapSbONu2JmCv/aDzfzjMAuZd3hwexDVgnm6lC5GxGrh//kRUUQtRPFK9airRzyNWj6TmsNX5m6sg7pjy1A+wK52F8H8HlzyavtIpvs1e5ujQiBGUx4lXUC/2IOcZbO0eeSHNucV2+YOxAHF6pbyz7xDzrn6q+yQ7TQjLhl9kmX71HazXyDIB69vYS7Uu+6rXjKMltltVYdz682+a3yCKmb4b19cxVrLPbbgrYLmu75DPEwzIy/wmUy4Sbe3vMIAMXr/iJo9otKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0fSh2PWRxKwA2Nlx5oKBk7TYF+XqVXZPYWlNhj9hts=;
 b=JxkC2MBfvtTdcG1ogzmGZQ8v0ZQfbXbJxEwgrnwMm7/SyNNYb24bN9edLBcq2Db3az2YPEPoJwapSn6f5vF2oj9v3/vwA1ou5F2UBIFMxm4PP3tYaTdLbt8ycav2Sb1SN4uo0byXfrBWUOjL7pstwCG7niiu+OtOQ3SZ+GxSnPiN3Bqx87+hG8vC/wCXn2GXIIwbfPFoyHsm296HY6MKZfJWh906jHeR46fu2ulU8pXp9Ow7wODia9JnCae5jI8PI3PHuSqKhbreu88OObOr3gSUZz6ZWwqO29sBhR/P6xJDwnw3TLiQ2+fOtFsoJGiJKc0e4SvqkmdvqeRYJ5ypNg==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by VE1PR10MB3872.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:162::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 08:38:43 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ffe4:701e:6fc:bd45]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ffe4:701e:6fc:bd45%4]) with mapi id 15.20.6340.030; Wed, 3 May 2023
 08:38:43 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     "tony@atomide.com" <tony@atomide.com>,
        "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>
Subject: Pinconf issues on AMxxx plattforms
Thread-Topic: Pinconf issues on AMxxx plattforms
Thread-Index: AQHZfZqrvd+zoW9TUEm12TIFY5PDMQ==
Date:   Wed, 3 May 2023 08:38:43 +0000
Message-ID: <aa493d62327f26e4c65d649a812346cdfb26771f.camel@siemens.com>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|VE1PR10MB3872:EE_
x-ms-office365-filtering-correlation-id: 89749fc8-60cf-4608-c2cc-08db4bb1cde8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H3unYGmnQxLYLmNzZR8MWk0AVmKnY4fRma1Se3r43FlKDaiXIFaTphmXyDT8MKCqXLrWyMicbD7x5Jw3S2FeyM6A+v/Sp1fNwTfTxAI7ZvhBHlC9cUYaT+xzI1NC9TCGZaOpTl8vLFLLxWVPuXjqbts98mvXNjXxuQnqpCvVmKmmg509NrqUQDJ9rrdobj4ahE8prtR29UrfBu4JdyGYJpfv7pUhcNJSrU8nposL9OhMHuYOLqibXzi3Q2v6w7TNgPZ6VA/CLShPhXw2vVh/XocSPclqbtcvtW/j5C2UxxpLr4v5Vb1VP0cYVciupb2WNaIOEmUHRQ/TUoevRTn62nZ36H422XpHE0QVTwHZX55mowIwrA/95GdtiDMns6yGP6l4GrQBGMneBcM40RmrU/2nHzH231G/Dq3h9biJrkYCEol0XBpeB5UnX8ZD5X28BYVa3prQunnTOGqaG0G1QKEC8ESDO9zzgacCf5HzZ5l25JmlmB/9bdj8Zi96cDEaZsq9vBKMa4wsoxKiIpuUHvOoVVAcRxLh4OL6sFZeT/C8d+89+7Ukx3tY9QBP1G+/G0mzLTv3zACSRx7qbHHgGtHABfeqYk6SAH2zXHmQz6SDwgdCJvSxnaCFsY8KEYOc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(66446008)(66476007)(66556008)(76116006)(4326008)(91956017)(6486002)(316002)(64756008)(38100700002)(6916009)(66946007)(186003)(6506007)(38070700005)(6512007)(478600001)(36756003)(82960400001)(54906003)(86362001)(71200400001)(5660300002)(83380400001)(122000001)(3450700001)(41300700001)(8936002)(8676002)(2906002)(2616005)(66899021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NElTZFBackJUYTlhbnpXS1lZblowZngzZGxoNlFOcHJQR1dFNWxqUGlGc1h1?=
 =?utf-8?B?VTZDZVBRVDFHOVdleE55K1pyemFGSG13UmNNcHByRFBaN3l0RC9kN0JMeFJs?=
 =?utf-8?B?cXNkK3FmSWpDNER3WlFlSjVrL3FuNDI0S2NyaXBHMFphdUdEcEc2S3JmSGtN?=
 =?utf-8?B?clZ5TGZTYWpJZnhneGlueEJUYzEycWhKREFHcjR5Y1A5ak16dmxMdnJqcFZK?=
 =?utf-8?B?WlNqSFg1eWhlbXhSOFB3M3E3NlRzcFhUQTBsdHZyUmRDQ3ZpSnlYUlNsTUpO?=
 =?utf-8?B?M1E3K3MweVRJZm9vMFo5YmhqbWhYTWE4MlJkWElkemhsRmg4Z1QxdnRMS1pR?=
 =?utf-8?B?L1gxMTZKZDRtWHBlaXdKTVdHcnF6VGtvcHFTUzUrRm4vSVBlL3NnWjh5eG16?=
 =?utf-8?B?RTNoM241MW94USsyWUtac1F0WER4TklyZXFwUllZYm5FdldqUVF1cDd4Tm10?=
 =?utf-8?B?Yk5HMGhnZ0x1SFVmYjFPbCt6N0d6bThmSlFRNllWSmsrcHEwVFNxQ3Zza3dy?=
 =?utf-8?B?ekgyR012MDR2YXkrVU0wTWd2ZldYNVdvaEdQRmZwYVR0Ni8waVIzbTJLZlll?=
 =?utf-8?B?ZVp4UEVYNkRack5QTXlpVThRT3Q3T3RNc0YxNVF2bWh0ajd6aEtlZVZua1Uz?=
 =?utf-8?B?MHZSZWlPS3FIRisvcW9WQk1GZEg4Rk1DMXFQRDljYmhMUWg1b3E4c3R2bHRB?=
 =?utf-8?B?R1E0RWVqS0xvSDJpVlNLU25XbGhLRE1ZREYrRDByS1lHbEtRNjUyamNmV2E3?=
 =?utf-8?B?WVlQQ2F2UWxMbGNNL1FuNDVKT3ZUS01EaTZ3Nkk0STBMcW9lM3pVZGZtQkMv?=
 =?utf-8?B?ZE50UXJnZ2c3VWl5STk0azlvQU1XNXBta0dqYUo4REIxSHlJNkpMTkxocEU0?=
 =?utf-8?B?a0VSVHFCYnVBZWkyK3V4dHR2dlBEbXhCdmI1MDQ1bnR4ekpkejhiSm5OdDNi?=
 =?utf-8?B?ZU9Qd2I4V3dmT0ZQcSs0R25YYlF3TjBCVTVLV3R4SWQ3cFpIRVNCeUxvUk40?=
 =?utf-8?B?MG5IU3hCWmc0WnZYUWE5bUZmS1NwMWdGdC9FZDJJZnVXRjhSSWVyeVhuMThx?=
 =?utf-8?B?UUc0RjdxRTBqZ2FwT0JIUjlSNmxPUHNvclNXTXpzem05aDJabTMxT3M3d2k2?=
 =?utf-8?B?dEZoMW5vclpDK3pPM0FNMWFHaDA1NmpOVXBCd0xMYW5MYWNXVFoyMkpENHJB?=
 =?utf-8?B?VUxJSkhBejVNZitSREc4V1M1MVlQYlJzZ29OaHdyd1c3K1JsdmQyQ2o1ZlJn?=
 =?utf-8?B?aDFCSU90dzE4UDQ0Q1hpc1BxTGlyUlFiamJITkNQbnU1K1l2Q2s1WU8zOHVt?=
 =?utf-8?B?dkhGM1MxdU1yNER2NTBVa0N2bDN6NGhIQ1E5ZjErVm5lTzArMk5naklxSmZv?=
 =?utf-8?B?VW1HTTdiNjI2bFB4TnI1dlA2UVpWRzFITnY1MC9aYXJORDVTR1Z5U2pNV1B5?=
 =?utf-8?B?Z1c4K1lkeDlvQy90dGo4WmdROXlNdGE5ZmVLdVpFeUVYWWliSmEzRVQ0UGZH?=
 =?utf-8?B?R25kazEzcUsrRk1tUWs3ZWpOODBYVzlibnVSMEpyamVvUFI4NDlwVDF4QVRz?=
 =?utf-8?B?SHZJY2Y0Uy8zSzVSWlBPSmF6eURMWEUxVkpkUkd5TGNyNUpVbUZxYUUzNGs5?=
 =?utf-8?B?Nm9wb1JQWE5vUjZXUnU5eG5wcnBwVEtWNkF5TVVPd09lbTBhbGJMN1h3bE1u?=
 =?utf-8?B?VzZCNWJYOGVMVFhFQldSNXpseFkycXhhMjJXZHdTWEFHQUdHelRKVlN4cHNO?=
 =?utf-8?B?QkNkSzZmaUI1aEJoQ3dkSkt0Vm5GaDhMK2QyMk41TXRYSzFsbm5RTXdJZHB4?=
 =?utf-8?B?aHYxdFMzaXdyYmJPSDROa2t5cjQvaThaQmdTakdqRlpQOUVFRHZlWnFpUWpC?=
 =?utf-8?B?bmlsRSt5ZU5hL0NvYUNGK1hzc2VaRnBIdHZVZWZrWENRRkkzZmZ2N0NhVXBh?=
 =?utf-8?B?WThsOVNqZE4xTG1IeVRlcTZMb1UvcUJEZlFUVTJ3bWYyS0FYaFB5UlEzeTZR?=
 =?utf-8?B?djRTOFNXSElnMzhSZDhMaWtqQnB0em8wOGJaTHo1Vm8vcEFyQ3ZiS1RxZjdB?=
 =?utf-8?B?UG5uTkt3U2c4TkNDNXZ1b3RlR0E5REJ0MU4zZVlFeU9HbkJTQ3dKM0RUVDhG?=
 =?utf-8?B?QVBwMGhQZktvWE5RM3UrWWNQdHhmVTByMzByWFlkaW1aaGJUcW1aYUovVXA2?=
 =?utf-8?B?bDdZdm9oMVBMSmp4Qkpjczd1cnBGaUxOOXh6MVhPWFNmdWxvL2hlV0dneDlL?=
 =?utf-8?Q?NBfXneDt4cG9XwZIBy97QSdyfKogsuTeN9RAUYJb6Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB79E73F62A00E4AB438427C4AC2A7E9@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 89749fc8-60cf-4608-c2cc-08db4bb1cde8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 08:38:43.8831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aFiIN7ukX6RfxwYS3XEEnAE4NJIEuj+iBzCFfpLdwJ6yHf93KVaJfkqCRk2erthFzP+JScequ/e5MXrX1H1j4oBVnSpjpuLMFb+f0NyiwOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3872
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SGVsbG8sDQoNCldlIGVuY291bnRlcmVkIHNvbWUgaXNzdWVzIHdoZW4gYWNjZXNzaW5nIHRoZSBn
cGlvY2hhcmRldiBpbnRlcmZhY2Ugb24gYW4NCkFNNjV4eCBwbGFmb3JtLg0KIA0KVGhlIGJhc2lj
IGlkZWEgd2FzIHRvIGZ1bGx5IHJlbHkgb24gYWxsIGZlYXR1cmVzIHRoZSBncGlvY2hhcmRldiBz
ZWVtcyB0bw0Kb2ZmZXIuIA0KSSBnb3QgYWxsIHJlbGV2YW50IGluZm9ybWF0aW9uIGZyb20gdGhl
IExpbnV4IEtlcm5lbCBEb2N1bWVudGF0aW9uDQooRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3Bp
bi1jb250cm9sLnJzdCkgYW5kIHNhdyANCnNvbWUgcHJlc2VudGF0aW9ucyBmcm9tIExpbnVzIFdh
bGxlaWogIHJlZ2FyZGluZyB0aGUgZ3Bpb2NoYXJkZXYNCmNhcGFiaWxpdGllcy4NCg0KSWYgSSB1
bmRlcnN0YW5kIHRoYXQgY29ycmVjdGx5IHRoZSBncGlvY2hhcmRldiBpbnRlcmZhY2Ugc2hvdWxk
IHN1cHBvcnQgdGhlDQpmb2xsb3dpbmcgZmVhdHVyZXM6DQoqIFJlcXVlc3RpbmcgZ3BpbyBwaW5z
IGZyb20gdXNlcnNwYWNlDQoqIFNldCBpbnB1dC9vdXRwdXQgZGlyZWN0aW9ucw0KKiBTZXQgQklB
UyBzZXR0aW5ncyAocHVsbC11cCwgcHVsbC1kb3duLCBldGMuKQ0KKiBHcGlvIGZ1bmN0aW9uIG9m
IHRoYXQgcGluIGF1dG9tYXRpY2FsbHkgZ2V0cyBtdXhlZCBpbiBpZiByZXF1ZXN0ZWQgDQoNClJl
cXVlc3RpbmcgcGlucyB3b3JrZWQgZm9yIG1lIGFzIGV4cGVjdGVkIGFmdGVyIEkgYWRkZWQgdGhl
IHJlcXVpcmVkIERUQg0KcHJvcGVydGllczoNCiogcGluY3RybC1zaW5nbGU6IEFkZCBlYWNoIHJl
cXVpcmVkIHBpbiB0byAicGluY3RybC1zaW5nbGUsZ3Bpby1yYW5nZSIgaW4NCnRoZSBwaW5jb250
cm9sbGVyIG5vZGUgDQoqIGdwaW86IEFkZCBlYWNoIHJlcXVpcmVkIHBpbiB0byBncGlvLXJhbmdl
IHByb3BlcnR5IGluIHRoZSBncGlvIG5vZGUNCg0KSSBhbHNvIGFkZGVkIHRoZSByZXF1aXJlZCBj
aGlsZG5vZGVzIGluIHRoZSBwaW5jdHJsIG5vZGU6DQoNCiZtYWluX3BteDAgew0KICAuLi4gDQog
ICBkNl9ncGlvOiBkNi1ncGlvIHsNCnBpbmN0cmwtc2luZ2xlLHBpbnMgPSA8DQovKiAoQUgxNikg
R1BJTzBfMzggKi8NCkFNNjVYX0lPUEFEKDB4MDA5OCwgUElOX0lOUFVULCA3KQ0KPjsNCnBpbmN0
cmwtc2luZ2xlLGJpYXMtcHVsbHVwICAgPSA8MHgyMDAwMCAgMHgyMDAwMCAgMHgxMDAwMCAgMHgz
MDAwMD47DQpwaW5jdHJsLXNpbmdsZSxiaWFzLXB1bGxkb3duID0gPDB4MDAwMDAgIDB4MCAgICAg
IDB4MTAwMDAgIDB4MzAwMDA+Ow0KfTsNCi4uLg0KfQ0KDQpXaGVuIEkgdHJpZWQgdG8gc2V0IGFu
eSBCSUFTIHNldHRpbmdzIG5vdGhpbmcgaGFwcGVuZWQgb3Igc29tZSBlcnJvciBvY2N1cmVkDQpp
biB0aGUga2VybmVsIGxvZ3MgKGknbSBub3QgMTAwJSBzdXJlIGFueW1vcmUgc2luY2UgYWxtb3N0
IDIgbW9udGhzIGhhdmUNCnBhc3QpLiANClRoZSBmaXJzdCB0aGluZyBJIGhhZCB0byBkbyB3YXMg
dG8gYXNzaWduIHRoZSBncGlvY2hpcF9nZW5lcmljX2NvbmZpZw0KY2FsbGJhY2sgdG8gdGhlIGdw
aW9jaGlvcCBmb3IgdGhhdCAoZ3Bpby1kYXZpbmNpLmMpLiBUaGlzIGNhbGxiYWNrIGluIHR1cm4N
CndpbGwgZmluYWxseSBjYWxsIHBjc19waW5jb25mX3NldCgpLCB3aGljaA0KaXMgdGhlIHBpbmN0
cmwgZHJpdmVycyByZWxhdGVkIGNhbGxiYWNrIGZvciBzZXR0aW5nIHRoZSBwaW5jb25mLg0KQnV0
IHN0aWxsIG5vIHN1Y2Nlc3MuLi4NCg0KVGhlbiBJIHdlbnQgZGVlcGVyIGludG8gdGhlIHJhYmJp
dCB3aG9sZSBhbmQgZW5jb3VudGVyZWQgdGhhdCB0aGUgZXJyb3IgaGFkDQp0byBkbyB3aXRoIHBj
c19nZXRfZnVuY3Rpb24oKSAocGluY3RybC1zaW5nbGUuYykuDQpJIGZvdW5kIG91dCB0aGF0IHRo
aXMgZnVuY3Rpb24gcmVxdWVzdHMgdGhlIGN1cnJlbnQgZnVuY3Rpb24gKG9yIHBpbm11eA0Kc3Rh
dGUpIGZyb20gdGhlIHBpbmN0cmwgc3Vic3lzdGVtIGNvcmUuIA0KVGhlIHBpbmN0cmwgZHJpdmVy
IG5lZWRzIHRoaXMgaW5mb3JtYXRpb24gZm9yIGFjY2Vzc2luZyB0aGUgY29ycmVjdCBwaW5jdHJs
DQpjaGlsZG5vZGUgYml0cy4gDQoNClNvIHdoYXQgaXMgdGhlIFByb2JsZW0gaGVyZT8NClRoZSBw
aW5jdHJsIG9mZmVycyAzIGRpZmZlcmVudCBvcHRpb25zIGZvciBtdXhpbmc6DQoNCjEuICBVc2lu
ZyB0aGUgZ2VuZXJpYyBrZXJuZWwgQVBJczogDQogICAgIENhbGwgcGluY3RybF9zZWxlY3Rfc3Rh
dGUoKSBmdW5jdGlvbiBhcyBzdGF0ZWQNCmluICBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvcGlu
LWNvbnRyb2wucnN0IChzZWN0aW9uICJQaW4gY29udHJvbCByZXF1ZXN0cw0KZnJvbSBkcml2ZXJz
IikuDQogICAgIFRoaXMgZnVuY3Rpb24gd2lsbCBzZWxlY3QgYSBkZWZpbmVkIHN0YXRlIHdoaWNo
IGhhcyBiZWVuIGRlZmluZWQgaW4gRFRCDQp3aXRoICJwaW5jdHJsLTAiLCAicGluY3RybC0xIiwg
InBpbmN0cmwteCINCjIuICBNdXggcGlucyB3aXRoIGRlYnVnZnM6DQogICAgIFdyaXRlIHRoZSBk
ZXNpcmVkIHBpbmdyb3VwIGFuZCBwaW5mdW5jdGlvbiBpbnRvIHRoZSAicGlubXV4LXNlbGVjdCIN
CmZpbGUgb2YgdGhlIHJlbGF0ZWQgcGluIGNvbnRyb2xsZXIuDQozLiBNdXggdGhlIEdQSU8gZnVu
Y3Rpb24gb2YgYSByZXF1ZXN0ZWQgR1BJTyBwaW4gYnkgY2FsbGluZyB0aGUgcGluY3RybA0KZHJp
dmVycyBwY3NfcmVxdWVzdF9ncGlvKCkgZnVuY3Rpb24uDQoNClRoZSBwcm9ibGVtIG5vdyBpcyB0
aGF0IG9ubHkgb3B0aW9uIDEuIHdpbGwgc3RvcmUgdGhlIGN1cnJlbnQgbXV4DQppbmZvcm1hdGlv
biBpbiB0aGUgcGluY3RybCBzdWJzeXN0ZW1zIGNvcmUuIA0KVGhlIHBpbmN0cmwtc2luZ2xlIGRy
aXZlciBoaWdobHkgZGVwZW5kcyBvbiB0aGF0IGluZm9ybWF0aW9uLCB3aGljaCBpcyBub3QNCmF2
YWlsYWJsZSBhdCBhbGwgd2VubiBtdXhpbmcgd2l0aCBvcHRpb25zIDImMy4NCg0KSSB3YXMgYWJs
ZSB0byBmaXggdGhhdCBmb3Igb3B0aW9uIDIgYnV0IG5vdCBmb3Igb3B0aW9uIDMuIFRoZSBwcm9i
bGVtIGhlcmUNCmlzIHRoYXQgdGhlIHBjc19yZXF1ZXN0X2dwaW8oKSBmdW5jdGlvbiBqdXN0IGRv
ZXMgbm90IHByb3ZpZGUgZW5vdWdoDQpwYXJhbWV0ZXJzIHdpdGggc3VmZmljaWVudCBpbmZvcm1h
dGlvbiBmb3IgYWNoaWV2aW5nIHRoYXQgdGFzay4NCiANCg0KSSdtIG5vdCBzdXJlIGlmIEkgbWlz
cyBzb21ldGhpbmcgaW1wb3J0YW50IGhlcmU/DQpBcmUgeW91IGF3YXJlIG9mIHRoaXMgaXNzdWU/
IA0KDQoNCkNoZWVycywNCmJlbmVkaWt0DQo=
