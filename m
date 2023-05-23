Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7DE70CF6C
	for <lists+linux-omap@lfdr.de>; Tue, 23 May 2023 02:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235332AbjEWAjT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 May 2023 20:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235537AbjEWAbC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 May 2023 20:31:02 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4012E64;
        Mon, 22 May 2023 17:22:40 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MKocgq025826;
        Mon, 22 May 2023 17:22:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=LeiT70P51ElhAFt3QOHfnrKmwoMS+Qm3U0xusT1bEIM=;
 b=nOt/qXCgXu3aB3G/HvlRLh7u3IQ+6sLHnREDRDXaSzuSPwkzFAW+eCbVce0n+WYMiZiS
 MahKXmET614GYIEDaPmm0g/nFsDq3nm8fwllzpC5GDaWfp3vuvEyafh37t6ABxlIjhX1
 BjrncPhNypNPVf0XBNl6BP8Xaovy9NvlScbEbOFrfIlQjsGNtzrFoyjTm14ObWiX2Lfx
 UL4C0CwgmvOPZa2nF0gIplvYp3LZhkm405ZxjTcyB7vJsZxkNZqVBoBRz7rWxXgGcYwY
 zPWFm2Kx1NjiA8W5QtNcH/k6Sud/z395iEGLgSXFLTQ5R8/g1nAFsRT3rw+spPRtBOBB 5Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qq11k94yw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 17:22:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684801355; bh=LeiT70P51ElhAFt3QOHfnrKmwoMS+Qm3U0xusT1bEIM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=MAqI0swu39epOfrsDOD+tYY+cKXiMsVoGUQr/R6aL7rE4X+bwCr2ZAuwvBMbrJx3/
         34pw9r2yi2PzhrkRDlgCCWX9F3xS7ViEDUreUvna5Dc+0uu3EvrqqeIVU+MaA7+AJy
         trzeVhNgKn1GNNR1p2hQfKrcDnNf3LHIQRjfR5mLy19qPM4P5a9lH/OKhnE2mhX3vO
         lmFg0rfSJF9nbxl6aSbDvREXhop330m0XoAJQTep/TMwntK4SAAkdzPFm8V9G8ZqKY
         V1umnbMBN5oB1iWhyML6gsUG9ViP0bRewN9J00gxzKeSEl8Cs72cuMOwZd8p+RByvz
         IOjbbiiRBg5yw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8F7F3403EC;
        Tue, 23 May 2023 00:22:35 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2E119A006E;
        Tue, 23 May 2023 00:22:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MCUj7gyV;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D7655403EC;
        Tue, 23 May 2023 00:22:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlloW0TWh7ljXPdd/Kjq9oA/1iru8dd2Gz5q06E+DOoctc4KrGx+ZqyIiuN/ACa5V4qQWdmkSgaMi5kyXFTI9pdFeM9Lzjj1xUiXnH/H4UzzCtQ0Gwq3Pqv+iGxQzi16bNxqgbA7pZFLcw+B09Y+BeAw2Ku3DfBVDvo4fKeHDwOj9K2iHho5WKGU0z4UYA3C6smtlH30hvSeIKtW1xqrhCnmeZbUJlr3Jblrdf5c+CedcjCkn4WCw1hirf7kHDio37QH4ydNPQMXxUC5kZWjczNj53/85kWDFMoneWbXJo+qbw/oV3yyBICB6OxUYuShv7RmC3ndlbPlwxCJXqV6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeiT70P51ElhAFt3QOHfnrKmwoMS+Qm3U0xusT1bEIM=;
 b=IqnO3/SC8EmLhsJXZ7Ib8OzMHR7jTLNJUi+pXZbHGGzu8Dirk8W8SKs6k3EpUCTIg9h5rOGlEPBzcayD40sRD2m8Vl0GRxLM5vKpT0KfdtpBwlh8c2/MtubctH8EuRN0wgq9AbTOzpNJi+TpL1RkEZ8keVutChIxa2JREoCy4evbonI4h9GHtLy6kRy3qCB6dmnFVq1hgMJh2e67PorJh3LNlGXkHFRUiq0jzgRoLO+5JOu3TbqzJW7Flankipm+tx/t7dVaE49P8iFCetFUAQ+daTWM2Cab2xWTTycBWDVM+2l5TIZc/g+Wp1CK5dsqZu8UJRF844PsFjK5iaEu2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeiT70P51ElhAFt3QOHfnrKmwoMS+Qm3U0xusT1bEIM=;
 b=MCUj7gyVtWxDk0kSN7Uh3dNxvXnTpUR0sC6w6LqR6LH8EJ4VXrX9s/Z+v1FDMMIzn0KVKWroEOrSC4kuP7Fa7ADCsV/aHl7nCz2ecm0lv2V6a9Dfm/G8+vSwlc/SrIypomVPpe/bWNreqrIJY/s3MFGMIphd//1hmuEDHIiQfTk=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 00:22:32 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%6]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 00:22:32 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 19/97] usb: dwc3-omap: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 19/97] usb: dwc3-omap: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRO2NfXx8YwfLkiCI3V4NnEMNq9nByUA
Date:   Tue, 23 May 2023 00:22:32 +0000
Message-ID: <20230523002226.ew37ize2edvyc26b@synopsys.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-20-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-20-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ0PR12MB6808:EE_
x-ms-office365-filtering-correlation-id: 246fda95-cf8a-4603-c098-08db5b23cd2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s0H1qzgunEMlajTZ0HBWdAHEkYPP3S6esFveNA7aFESiYOz8yAKYU7ulQ26ng5N5DBa6uVvRA5lzrJqi7XWJHQ57sM9aAueQBOnCjt8cE6NYOhbzMIX/RTDToaB1O46mavvOfby6Ze3kvb9Kiz7iFzE1AshO+dZJePWT6L40159aaFWeRKBDRWbCYefanoRjvbwFhnYhQGufVLR9JFDf6kkVo32CXaxrh+AS3qCS+j+LX992NODFFcZgsneFBUdnNDCMzPmoi+k+BXk8dN0C/Bnv9k0GKte25W49iZTQ59gcLhlfTxH6EvKbki6bkqFnvqTv2kvaeWEdQfWtmJpEk9VCBOhhvdiPiWay8hvA50Jeao7FJVqROMBJtZDc2ESO55cHuoLM4t6bANfmYpX6i5UYZtzFMyqVHTs4V0GoKf1qizgVrtNPFkdsqqLHSB5wxQxuLFxqOPeHr5vO2sbXmbRHxmPOHt29mEOWfxrKssyzAm8OiT2nfjRGRt/plaZo/XXRQcbm5+8GAQ3ixx4aRPlDl2kphQ9FE2BACDFZh6x4COWGNUqsuZlKtd0IilGIz+dHqIUbPjZEiqhZNPiZA5tpQFmPN9sOx+ZB/rWUMvoq2iCPxQ++qJJQjlHOSXx5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(5660300002)(8936002)(8676002)(66574015)(83380400001)(2906002)(36756003)(186003)(2616005)(122000001)(38100700002)(38070700005)(86362001)(6512007)(6506007)(1076003)(26005)(54906003)(71200400001)(316002)(478600001)(66446008)(64756008)(66476007)(6916009)(4326008)(66556008)(76116006)(66946007)(6486002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aStoSm9XZGJBSm9ZY254YjBMb2dDc2U3UkpncTVQMjVEM3FSemtNTmZSbmJm?=
 =?utf-8?B?Y1NOUjd0MjdCNFVEcng0RGZRSHpROUU3bXU3UXloTVdZMkp6Vys4Uy9HYzNJ?=
 =?utf-8?B?VExneVBpRy9tblh5M2pKZnpTbE85VGE4WW9QWGNYSXhES3dWWTk2NWt3c0JF?=
 =?utf-8?B?WVF6cHl5dWdtUUN3QmNVakNxNVpubTJhaHFKczlZMWVYTFFnYWh1Z04yYWp0?=
 =?utf-8?B?LzFFR1p0ZnhmMHErNGIzY1FMSU1PZDJKSDA2cE5pdjllRXR2WU5EaFAvTkds?=
 =?utf-8?B?UURlVEZGSDV0QWtsUHVRSFFSUVdzaG9pT09HaExqM1ZwRFpuV2I5Ylp5dDJN?=
 =?utf-8?B?WWJyU1ErT3hXWnNteGl0YzJwVUEwMjRYOVNzNzlmZU5odkxxUlNLN1Q0Mnds?=
 =?utf-8?B?d2ZtVEF4Q2dzWW5NdWhkeVhvRllqTWt0T0EvY2FPUGFUbUVIVUt0dllya1NK?=
 =?utf-8?B?NCt4Z2JiZWxtYlRIS2U1MkFRR3VrRWo5NnpyTmVweFBqSVJmUzdKMVcrZktV?=
 =?utf-8?B?MDVHbGJrVVRIbDVLYUtFdGZNaWliRlhQM3dONHY5TUpxMjh6VUNmKzlsVkdW?=
 =?utf-8?B?dkN6OGZuWkkyMkRVbVpMQkNtd0FtQjkraXpZaG5FNlhVdEdFb3JZZmhMZWpU?=
 =?utf-8?B?TW5tcy8yVXdkRWR4RTNINTY5ZFRQcGdLaU1lcWw3YUhCU2dOS094K1crN1F3?=
 =?utf-8?B?dTBOa2tMR1NJSDg4a2YzaVlUU091R05GOUdpc3Ava2dkV0xWc21xUXhrZitD?=
 =?utf-8?B?UjJ4enhHQmRDLzZiendYSUFPTHYxQjBXNkxBaVVYV01OVU5KWm1vUkxhZFNz?=
 =?utf-8?B?aUdxQkwvK0RoVGlsRUhDSFN6Zk1tV05lclRxT1J5NlJMNmQ5V1pyaXdGRTdT?=
 =?utf-8?B?dFE5WFFPcFl5bzN4dW92U01Kb3phK2xWSTlMK2VNYkkwRjFlNmZVcWVkaWs4?=
 =?utf-8?B?VjlYenMyL09pTDFBOG1WTXJ0cFgyMDFZVjkrVU94eXdzQytYUGpqRnp1U3FU?=
 =?utf-8?B?cEc3bHZNb3JkYU1FZGh2L25tejN6Q3ZhMlR1eHpVditPVzNaWENHWUp0VEZn?=
 =?utf-8?B?U0JZYk9OOFJUb0lFS2JKMkJocmF1UytMRExnVk44VUVmRURFWkdCWTN5Rllu?=
 =?utf-8?B?NGNhRlJYTzVabURjMmZDYmFET3RWU1JheC9IU0hpM2RlTXgvK0FTdXhENUdu?=
 =?utf-8?B?ZVZzK29iYm5MblJrb1l4WXFNL3AvN1hEQVZSUlI1NjVDUlZYendOek5FamN5?=
 =?utf-8?B?aHRCQm5rOGc3MHNFZkFDWWtqNVpYcFFMb290T09nWDVXTjlWei9Nd2J5WjVB?=
 =?utf-8?B?aWpmWWY5SFlFRmNiTkRSMGZlYmRWaXN1clh6NHhlNEZ2YzF1RjMvNFJvV2pT?=
 =?utf-8?B?cUR2S3FSVUdKTzVWblMxRmVoNGhlSS9nNFNBdFZnWGdiZFpNUnNDS3h4cDFi?=
 =?utf-8?B?OUdaYjY3K0ZBcmdPMkt5aVkzakE1Qm5TblM2TFVyZU9JV1Q2QXRtV1hEMkJB?=
 =?utf-8?B?OFNyb3ZCaExvZzUydXg0TCtXWFRQd1d6RE5CU1RYRVpHTitBY0ZJa0toZ2Rs?=
 =?utf-8?B?N3p1ZW1aOUFhenZOK2ttUmJuL0hsMktZY05hMzJPYTNucU1yemFjZFhnS1RF?=
 =?utf-8?B?SkNhOFYwNFM3TmgvV0pUaFl2R29tMGhFR3VPY2o5YlVOTFZqVmx1bTNTTlgr?=
 =?utf-8?B?bG5idUJYbmtyZmRwb2MwVkxVTE9senV3Wm9CY2NWNm9HR29SeXd0Q1NTRy9t?=
 =?utf-8?B?WHFRN3pITVZWUW9QWEJYL2JHemtIN1Uyd0trVnlWdkZEMm82RWhmNWNFRk8w?=
 =?utf-8?B?MHFTYmIxV0l1WGFrNVltaGY1VmZQMGwrZSs5ZEpmNEtUbzVkZlRZbXhZc1F6?=
 =?utf-8?B?dkJjY3pWYWVUSExvMlBEYnBBbnB0NDkzQmxRclRrL3Y0S0ZGT1ROdFFRZldZ?=
 =?utf-8?B?ekxhMSt4ZFVtd1VKdHlGd0xqRjhCWjYveWF5SDNjVE1zZElUeTBoYkp1T2Y0?=
 =?utf-8?B?eGxRU0lNaEhxS2Uza1BZK0tWTGgwYjdWVzZlY3QrVVRhV2pOZmJCSUdMeGl0?=
 =?utf-8?B?RUFTUk1yeXNPQjBLaWU4WElMRnlkKzE0ejFJbmszNmQzK3FuaWtpVUt2SFVL?=
 =?utf-8?B?NGNxaEZxdHk3eU01U1NET2hPQzBnNDhUc2tCNWFTRUxnNWVrcXIwQm1ubWwy?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C132E58D1805C49AED78434A5E5C1E0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: XoqxsHpqOQFv3lrb4z8ekhNC37SWVENa5LdDx3zFB+b9hy5vghUhMy7C9OJOxpsRZuXUBTicM9+Xvr28XD7Rb4c4/BS6ZNjB/sjpxbfUFN77zBTneD1NdQKZ44rJeT6KGM7vOkOfQQvrcqGbB2Lh+rZKs+szgyPz9cHkmKCoQEry6LPNlRI2tK9bnn5VFL/x6rrDJoJUZNFpkHqFS1tI5uvt/GZhpkcJ530jPINWi5QUfECfEwyzpzFXi1f8IDi/WVRl31RoYCKdBBM0ef3/ykhwLana/3qcvDB5hzfNz0Sw/yZkvCHlpkzcdfmano8czy19zB12iJ7HdxrYa/EYKbxeb8X60xy2HE23SPuOEiQq8xLLFvsCabnookvdQNRoSkdzU1Q9MbY7hFEaxqx7PYeHVV26/CzB0bnzrDB7LIgQ/KfYUnXORLsbGLmfufpnGrGWeQ9qUgEbAt43U5nNHC2wmP2ZpizFU5q+72fD6sn2rMrne0bwRUGAskBblzDALKXNScg03UO+rI8Leu6zW5s2NoUiReg1s/EW1Y0ucPnq2c10qs+lF/IvIRTKYEr/PPla6msVBpAXdltnEnK5wlk7iBGFd1ouq/ETHeyj5I2nsVZuD+R29ZiIKiyczScVkuIwhuWc7ZibiyRsN6RRlCRfNfJnTjUHBv3ED2F6J9cW6nZfr/kKDHw6c7Cv7wVU8V4buq7aIZyiiorkZz030jwh11pHFjl3ej6RM2X9t8tu4kZJJFn//HxCHQ4TG39OJ+HqiIfDFElLsOM45g3XbOzE/imo5byQkMAXKOD1MeIKk/7z4Vcpogo2GlCw2ZWVHGFELxY4ChFuG7n5OpASN4tltQ/fiq3Df/p/IwlO+e+DVp2OO6sqN3qEeSzYhHUXVvu1l+Mp2HthlP2DjzpY9w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246fda95-cf8a-4603-c098-08db5b23cd2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 00:22:32.6695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gUgqYSichS4+OWMD5N989Y1vR5aAdy+HWUw3dy8ZwoH0nMkW2cj50rU0ICqac6rWIMw7BZ7NI9cJuHO5uzkRZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808
X-Proofpoint-GUID: C5b13Er_MOBvWajSHgLqf7D9Hh0i388d
X-Proofpoint-ORIG-GUID: C5b13Er_MOBvWajSHgLqf7D9Hh0i388d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 impostorscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gVGh1LCBNYXkgMTgsIDIwMjMsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KPiBUaGUgLnJl
bW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGlj
aCBtYWtlcw0KPiBtYW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2li
bGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcgYnkNCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhv
d2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGlnbm9yZWQgKGFwYXJ0IGZyb20NCj4gZW1pdHRp
bmcgYSB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFr
cy4gVG8gaW1wcm92ZQ0KPiBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3Zl
IGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3QNCj4gc3RlcCBvZiB0aGlzIHF1ZXN0
IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBhbHJlYWR5
DQo+IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycyBhcmUgY29udmVy
dGVkLCAucmVtb3ZlX25ldygpIGlzDQo+IHJlbmFtZWQgdG8gLnJlbW92ZSgpLg0KPiANCj4gVHJp
dmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4g
dGhlIHJlbW92ZQ0KPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLW9tYXAuYyB8IDYg
KystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vbWFwLmMgYi9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtb21hcC5jDQo+IGluZGV4IGVmYWYwZGI1OTVmNC4uZDVjNzdkYjRk
YWE5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb21hcC5jDQo+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vbWFwLmMNCj4gQEAgLTUzNCw3ICs1MzQsNyBAQCBzdGF0
aWMgaW50IGR3YzNfb21hcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAg
CXJldHVybiByZXQ7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBpbnQgZHdjM19vbWFwX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArc3RhdGljIHZvaWQgZHdjM19vbWFwX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBkd2Mz
X29tYXAJKm9tYXAgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gIA0KPiBAQCAtNTQz
LDggKzU0Myw2IEBAIHN0YXRpYyBpbnQgZHdjM19vbWFwX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgCW9mX3BsYXRmb3JtX2RlcG9wdWxhdGUob21hcC0+ZGV2KTsNCj4g
IAlwbV9ydW50aW1lX3B1dF9zeW5jKCZwZGV2LT5kZXYpOw0KPiAgCXBtX3J1bnRpbWVfZGlzYWJs
ZSgmcGRldi0+ZGV2KTsNCj4gLQ0KPiAtCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBvZl9kd2MzX21hdGNoW10gPSB7DQo+IEBAIC02MTEs
NyArNjA5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGR3YzNfb21hcF9kZXZf
cG1fb3BzID0gew0KPiAgDQo+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBkd2MzX29t
YXBfZHJpdmVyID0gew0KPiAgCS5wcm9iZQkJPSBkd2MzX29tYXBfcHJvYmUsDQo+IC0JLnJlbW92
ZQkJPSBkd2MzX29tYXBfcmVtb3ZlLA0KPiArCS5yZW1vdmVfbmV3CT0gZHdjM19vbWFwX3JlbW92
ZSwNCj4gIAkuZHJpdmVyCQk9IHsNCj4gIAkJLm5hbWUJPSAib21hcC1kd2MzIiwNCj4gIAkJLm9m
X21hdGNoX3RhYmxlCT0gb2ZfZHdjM19tYXRjaCwNCj4gLS0gDQo+IDIuMzkuMg0KPiANCg0KQWNr
ZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtz
LA0KVGhpbmg=
