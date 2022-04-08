Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA6594F8E5F
	for <lists+linux-omap@lfdr.de>; Fri,  8 Apr 2022 08:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbiDHGS4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Apr 2022 02:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbiDHGSz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Apr 2022 02:18:55 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD68212FF9A;
        Thu,  7 Apr 2022 23:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649398610; x=1680934610;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IVMYYbPNf90ktDcL4ajuAKyI15/uwggOYepXvoh5D6Y=;
  b=RcPV+R53SxbgPRjSPPjQD7q6LVjJovqzGBrur/LIlxQ8wgxUxyt0hWEI
   TFer9x2AwxCdi0pTNEQNkCjveaofmVGE/Ygcmbmve6cz3Qw/xTWLTdjUM
   1JV035h41A07zXxBBaamFAEr7ksXQGoAgmzS3St5EEhHxhTSKjKIBdEaY
   phzCnZafcJ/M6DCcc2WK39HzN420bFwRLwmuWtyz3CPBxgSgj4bezhwpI
   krzGB74Ihrlo1LlyYzrbzDLrejEmq2VffRnCJXzrRYwDrd/DnZkc8EWTz
   Q8nb23Lw5SXyYXzAhuLA06Zwi3T4FmDO2sHfPX/Vys6+FOrXLPODa17t8
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,244,1643698800"; 
   d="scan'208";a="159393288"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Apr 2022 23:16:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 7 Apr 2022 23:16:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 7 Apr 2022 23:16:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APOdklTbKA1O22hCxR3phZtpwH+uRjxPeub4DnpMX8hQYfdH1CiU2tAjtGk+ex0N38HB0lUPtq4F0qIe5lGh+RXY4LCH/v6dnHWBFX3CXqbfRO9fCjIsuHRKwRqZ5/atBNR09/gPCQLytbnf0HVZmAl59SHL9O/LQmJ+JjYZpeqhCkdD4TEY7kIyhbSG9o+atU7kaeC39HM4/huGd+CtX0bWlHf6jR65UE8la0RnOjX8bf4vPIwJ87pTgwk8ovFHoLV5UR/29rfUpyAd2viNtP+G76o9gF5VD7esQGD9hM7wdUVrKENKaQdOTNg3hOGnzD4NeVm3ta+7QUqHbnKPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVMYYbPNf90ktDcL4ajuAKyI15/uwggOYepXvoh5D6Y=;
 b=jYmeA5RMpBrx+UbGP6xYE+Uc05ZVBnrtG8SzV9VcklLNgtEM4xxnLhmyTTyeS2CTZ94px9wjQut+m9YySsXB8C4TISEWi0Jm0fE9CChme0aeSUTBpm+zFhJqOcGuWBykgKhbKLCt5Bb+ZhMzPs8TUc16t6QwM3cx/Fz6YMSIwcCmihS01kJN6VlmlgrAu4udGC4/i7sZ812GCQl/78MBzENNRPZ1hmAAy5nzRqsn9bgF/RtbUL16tJ5YvsitYkL/6CkpaipHHrB1Q8lgRFQHrV1e9IwujXtixqsIPY/JhncJEv6ZQtz+8G9dvNiOScPNFG6ziW42BYiAfLlHpzFsXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVMYYbPNf90ktDcL4ajuAKyI15/uwggOYepXvoh5D6Y=;
 b=qjn6SuvtlbA6sBe4S72Bl/LC1+TdiNb68Tm2XDSje0GLFj59UxOH21P3WudN16L5vd7yIo2nh4oR+PAGuZElOWuFzvQhH7ykrdP/Y/VRKhkSjag9RvX4OWoANBvpNlyfw0NPcrsy5fmGdnVG63lfgPPXm2QjlDtFInq8hRnnggM=
Received: from CO1PR11MB4769.namprd11.prod.outlook.com (2603:10b6:303:91::21)
 by BN6PR11MB4051.namprd11.prod.outlook.com (2603:10b6:405:79::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 06:16:43 +0000
Received: from CO1PR11MB4769.namprd11.prod.outlook.com
 ([fe80::6d66:3f1d:7b05:660b]) by CO1PR11MB4769.namprd11.prod.outlook.com
 ([fe80::6d66:3f1d:7b05:660b%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 06:16:43 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <robh@kernel.org>, <soc@kernel.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <krzk+dt@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <bcousson@baylibre.com>, <tony@atomide.com>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: Fix more boolean properties with values
Thread-Topic: [PATCH] ARM: dts: Fix more boolean properties with values
Thread-Index: AQHYSxA3mOeSQEJON0e+YgWpRpBuqw==
Date:   Fri, 8 Apr 2022 06:16:42 +0000
Message-ID: <73d6dc5e-0883-7e5d-aeae-704e436ca190@microchip.com>
References: <20220407225107.2175958-1-robh@kernel.org>
In-Reply-To: <20220407225107.2175958-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80adec65-d0b7-4bf6-56d6-08da192759f9
x-ms-traffictypediagnostic: BN6PR11MB4051:EE_
x-microsoft-antispam-prvs: <BN6PR11MB4051354179D5D79DF6022D8887E99@BN6PR11MB4051.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g4PDYaboZVvcKwGNU/k3Ojours3n94KSICanYMLclHcS/jkTZSybAWxHPk0mO42OcrsvSRmDcHq9g0uQAmzJtGLQ+E0cnkAqfSdWhLvRHkPTvimfRphY/dZrPOHhsOGSelKNlNk2Da93thQBwndSOdeDmHnOxZ/WZZaVUow0WVqHF+qsYegfJLj2JvXQq3kMpbGhcvgEHkRWFv49KTgXS5GBPX/INXUwooT9TPnMzX6pUnFEqumbpt0+JYBp95BUX+jmz4ufgkPSuGwZ768eFIvgo8jez3mn0ZFWd8APvxGN5Oig6QKZlTGEE05pEmlf2xLjQIPlsj/fir9dDpFJcaPyrf/hMjI+M8nR8KJSohJuKwoCYvMnIftuFlBLYeIcDPfLKGQLe3YW6IsNR8AN5YNY8h88bZYnDm64B7bi3KYoqKycjukfTfqLEv8qdTgrpzv4zTGA75N8tsKPwhZNUSkya8ofhCOQ2E4HZznmuKk2XGPEUUVnBJ2mitl051CiAAeLSV4yAj1/q35XQbmVFA+vtmtXWg3c0KoEeLF3eLUwrrPThrsGwY0vf5zqHkDMsVtyS2sPg4OQdTkTKTY6usxs4JvS1sI6Eek0UBiB6XA+hkz/DJMpAG6SCwin+LGKJ5P2rv1zXshJGx+CXD6yAfymvUZG3gDg46FSHOHZJLFLs0t/pmPKJ3hfMl7MVzW4SwlniN1BLVnkS/i+xqfs0W4lSM4xo4yuSsJsAaVS/yIBhLjXXWDYWTF5J2N7L4h5tMiMaUINSA0nWDAoiBQXUg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4769.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(110136005)(86362001)(5660300002)(8936002)(54906003)(31686004)(186003)(26005)(36756003)(31696002)(2906002)(7416002)(91956017)(71200400001)(508600001)(6506007)(38070700005)(6486002)(53546011)(76116006)(8676002)(4326008)(38100700002)(66446008)(66556008)(316002)(64756008)(66476007)(66946007)(6512007)(2616005)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFhkSmluMTlMRnhzOGhrQTI0U3VheE5DaXVFMFNPWkFkNHY2STlDelR6QjRv?=
 =?utf-8?B?QkRrWE5qK0VicmVKV21Xb3dNSHUzeUUxdjJ6MlhONWY4T2ZwclNkTklhTkgz?=
 =?utf-8?B?SjlESUp1bS9vZjRqYnFkbjhrb04vTmp4Y1ZGa3E4bFA1SjF4WjJER2JFOEFM?=
 =?utf-8?B?Vm1rRG9tYkNVeHljelpzM3NtcEFiWHBOajk3M1lPNzJZRnZxL290Q1NrV1Fk?=
 =?utf-8?B?dkpka0ZqSUhSeGw4aU1PejByR2g1R3k3dmxEbXo0KzdiTE9scE1uRFRCc2Rh?=
 =?utf-8?B?Tjk3NVVEMXZBUTJRWmZwY05sUkJaZVZqNFNoYkM3cWYvSndIK085OHBkOURO?=
 =?utf-8?B?U1ZDRkdwd0crRmFOZlVrYTZyYjNIeE96TVVRSjRTaXdQeFNSSENBWi9xOUds?=
 =?utf-8?B?VXBGRWdndnV5bzFHclhpTnZRT2pDaGgweVVKOUh2ZEIvbzVuZkg1aTFuV0Ni?=
 =?utf-8?B?d0tiMmZWU0Z4c2xSd2ViZ1ZhZmlUQ1ZyU285YnUyU1lyM3cwalozeFYzWU1j?=
 =?utf-8?B?Wm1rU1FOMURlUWs4UVZjSldlZFdrcHNFdHRFQlp4NUYwU0d0L0FIaWM4RGxJ?=
 =?utf-8?B?MDAyZFRyZmIvS0tzT0NqN0J3UktWZ045Tm03MUVRTHRqcVhmdGlHY3pMTDFi?=
 =?utf-8?B?S2pQN2I4a2gyUHpkbDhWeWhnOG9MZ0o5S05Md2U3dDZOUUVVdERoVnl1cTZv?=
 =?utf-8?B?dE5kWVhqWjl2Q2hFK3NBSC9rWTBpN0F4Q29EN2FVMWpjMklhOTh2OFRFdEEx?=
 =?utf-8?B?cXpYckNmckZvQXhmN1h1NktPZkRlb1JHQWFZaUJBV3grNktrTGIveFVheVky?=
 =?utf-8?B?K2UxdENVcHBCQkdOOGJvM0RaNXEvZDQ1aXJ0N2o2ZjdTaDFlU1V5YmI3d2tp?=
 =?utf-8?B?bzNYVmNUQ3Y2YjhzbzNxemxyeFJXOW42TGthUFUvK2ZZQXJRSFg4WW5lOG4z?=
 =?utf-8?B?WnVjMGZzdkduRnEyTmdLMUV1L3hSeUduU0hxRmVIU1VPblVneHZ6QTR6dkFr?=
 =?utf-8?B?TmpPTUY1bFh2MzVhZlJXandvUEc3NkptRkwxdTZVcHd0SnQyZUZSeVMxWmp0?=
 =?utf-8?B?SjNFZk9zSE1hWnpMM0JHREVFUW9LT1JjTk5CaGRQM3NSWjhsR2hnbWJISG5o?=
 =?utf-8?B?c0p4L3lYOHpWN1JmOXQwWWdRd2NLZVQ2WFlKL096aHlaMkhGSlVhVnZHZEM3?=
 =?utf-8?B?bUUwK2JQSFhCWFFWeTFaVFJmelZzOFg4S1o3SFd6OHNiUXMxNFJ5UmRNeFEr?=
 =?utf-8?B?ZVpHdmJBZ0NqZDE3ZkFLN2txSjNEbG9YVisvWXYxK0lldXR3MDMwOVlTaGwv?=
 =?utf-8?B?Z3hscCtEWnV0MjNBdnphb3EwUFkvQlRPU1QvTVNGTW8rOHJreVpDd3ZNdUd6?=
 =?utf-8?B?Q2JFQ1J2R2NXQ3B2TzJvNkR3emg5STU3MitJSGp6S21pTFZLMjcrT3JPeXMv?=
 =?utf-8?B?WkpuWnpXWWlxL2Evc1FJdG1xK2RpVEpmZUE4UlhIK2F4NE41TzBjeElLUTJV?=
 =?utf-8?B?bzBJcjUyUFdPRHI4cUE3Yld2ekRNNzRjOFhJRlgzMlNuN25LZFBYckcraGNo?=
 =?utf-8?B?UTZvUTAxaUlFaC9lSnV4dlk2SU1lNnFJT1RUbmFld3lncDZDRDN0WS9aaVdG?=
 =?utf-8?B?V0d5SWlGS1gyQll5cHNqWDFRZDFOenp3cTE3TExzRnlBM3N2SUVLbEM0SUor?=
 =?utf-8?B?K0JSQm0vY0Y4WVdjYjBIbjZ2YzFkbno0MzZyK1BFSVBVaWlpd3NuVllraUYz?=
 =?utf-8?B?ajFXVHhJTFRuQlRZczl4SzJuQmZSUUVGVURKVk1YRWlLc3VxdzRtNy85L0Jo?=
 =?utf-8?B?LzFGRGRWSnZjV3pyUXJXY2FoemQ4bGtGWTNVek5Da1ZtOW5RK2hDYjA1dXJB?=
 =?utf-8?B?Y2RvT1VYZXdsRlR0VCtpU3ZVT0N2R0d6Y1B6eWxpS0ZXR2JkSGlBTlZZcXhG?=
 =?utf-8?B?Q1R1S29QNGZXWEIvbkFSVHpSWFMrY29zYTRaTFdOWUV5M0d6ZENyY0tTUzgv?=
 =?utf-8?B?WkF5d1laSDczYk5JWHp6Wno1KzlYOXA1SXU2TjRKVHJkOTlhdWFWdURDalpm?=
 =?utf-8?B?bnVycW8zc0hIeE0wYUZhUHptalNkTER6R3JWUmloUXpkSU5EVEQ1YjhVdDJs?=
 =?utf-8?B?cFE2OEwzK0VwZVo4enNhNHVNamdMcUZOaDgxeGVmMW82b0FwWDJMZ2ppZEox?=
 =?utf-8?B?VkEwcnBCaGxMZnVSbzBDVEpFdUQxT0I5d2RsdlFuWHpUeTFDOXRITURYQzVJ?=
 =?utf-8?B?My90VUkrNDc3ZGJlekEwMThzdDArVDM5S0piRW04dlZBVndWUnV5cFNGUHdV?=
 =?utf-8?B?Q2FNWlRFL1V6am5pK2lOKzJhYkNHQU9oV2pWTG8xRGxMZjNQdWJSWXN0dWNS?=
 =?utf-8?Q?ZAvEwGFA9vvHs0/M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E3C0F052E3DED4C95890876062B32DD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4769.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80adec65-d0b7-4bf6-56d6-08da192759f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 06:16:42.8872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j6J8eehWh9bp5LqvhkfduqvvlkUQ68dAFgqu0JnPBD4VbqjdjpJOzfXAcC7CEAbnDpM6VwXu2rmWpU/O8Pm8BiRJDowTqgfsiC2A3rnkjgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4051
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gMDguMDQuMjAyMiAwMTo1MSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEJvb2xlYW4gcHJvcGVy
dGllcyBpbiBEVCBhcmUgcHJlc2VudCBvciBub3QgcHJlc2VudCBhbmQgZG9uJ3QgdGFrZSBhIHZh
bHVlLg0KPiBBIHByb3BlcnR5IHN1Y2ggYXMgJ2ZvbyA9IDwwPjsnIGV2YWx1YXRlZCB0byB0cnVl
LiBJT1csIHRoZSB2YWx1ZSBkb2Vzbid0DQo+IG1hdHRlci4NCj4gDQo+IEl0IG1heSBoYXZlIGJl
ZW4gaW50ZW5kZWQgdGhhdCAwIHZhbHVlcyBhcmUgZmFsc2UsIGJ1dCB0aGVyZSBpcyBubyBjaGFu
Z2UNCj4gaW4gYmVoYXZpb3Igd2l0aCB0aGlzIHBhdGNoLg0KPiANCj4gQ2M6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz4NCj4gQ2M6IE5pY29sYXMgRmVycmUgPG5pY29s
YXMuZmVycmVAbWljcm9jaGlwLmNvbT4NCj4gQ2M6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5k
cmUuYmVsbG9uaUBib290bGluLmNvbT4NCj4gQ2M6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJl
em5lYUBtaWNyb2NoaXAuY29tPg0KPiBDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3Jn
Pg0KPiBDYzogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiBDYzogUGVu
Z3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4NCj4gQ2M6IEZhYmlv
IEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4NCj4gQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51
eC1pbXhAbnhwLmNvbT4NCj4gQ2M6ICJCZW5vw650IENvdXNzb24iIDxiY291c3NvbkBiYXlsaWJy
ZS5jb20+DQo+IENjOiBUb255IExpbmRncmVuIDx0b255QGF0b21pZGUuY29tPg0KPiBDYzogQW5k
eSBHcm9zcyA8YWdyb3NzQGtlcm5lbC5vcmc+DQo+IENjOiBCam9ybiBBbmRlcnNzb24gPGJqb3Ju
LmFuZGVyc3NvbkBsaW5hcm8ub3JnPg0KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnDQo+IENjOiBsaW51eC1vbWFwQHZnZXIua2VybmVsLm9yZw0KPiBDYzogbGludXgt
YXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4NCj4gLS0tDQo+ICBhcmNoL2FybS9ib290L2R0cy9hdDkxLXNhbTlfbDky
NjAuZHRzICAgICAgICAgICAgfCAyICstDQoNCkZvciB0aGlzIG9uZToNClJldmlld2VkLWJ5OiBD
bGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT4NCg0KPiAgYXJjaC9h
cm0vYm9vdC9kdHMvaW14MjgtdHM0NjAwLmR0cyAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgYXJj
aC9hcm0vYm9vdC9kdHMvbG9naWNwZC10b3JwZWRvLWJhc2Vib2FyZC5kdHNpIHwgNCArKy0tDQo+
ICBhcmNoL2FybS9ib290L2R0cy9xY29tLWlwcTgwNjQuZHRzaSAgICAgICAgICAgICAgfCA4ICsr
KystLS0tDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkNCj4gDQo=
