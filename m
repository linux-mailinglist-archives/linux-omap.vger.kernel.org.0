Return-Path: <linux-omap+bounces-1909-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1CB95262C
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2024 01:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B944DB22B01
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2024 23:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB0114E2FA;
	Wed, 14 Aug 2024 23:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YDotyGsU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XdV5to+l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="v1Obo7sS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E471494D9;
	Wed, 14 Aug 2024 23:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723677754; cv=fail; b=Za8dc7YHAtfdukdYEd/MLJxOvLGVnIKCCH+NucDDajnBFZJIQcn+eU8DT5wA0WnnkMyNSxCYAQ/hEy5KX9AHRMbriiTQp44BSW2sFO04hbV03Kbg8HcXrjz2/G0yql3L8H85ySRIJMS196tYjqNTXhrS0mTJoXST7V/3dtKhTeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723677754; c=relaxed/simple;
	bh=QrtLOWv3YTrzEZE+4Gbkq8V8YCc6iFN/D7E9YxRCN0k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hzYNIkpfHkVquOIXYAdpZNHz3jWjVvSTlNO3993hqwgL7fZ7SVyj+KA9Vg9ZEBgoF3PT26uoawem00bpHQDrd5EHjKklnIUW66PcGOfjVwl3//3AKHxmgbly88MQeUeTX7hurw9PUMOCTVVWzkaHQc87b5P9KwzkM4tyRR/pSd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YDotyGsU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XdV5to+l; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=v1Obo7sS reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EHrhfc027368;
	Wed, 14 Aug 2024 16:22:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=QrtLOWv3YTrzEZE+4Gbkq8V8YCc6iFN/D7E9YxRCN0k=; b=
	YDotyGsUNUeNfRj6yu0KWR3O8ySoLbAinws6TrIBBaBGF4Bv/0+eKqXXyfS2Z8P/
	MUZKgGiJP14ho1WGyO2vYnkSjWoRF0mbmylC1MV2FbiHPFb8LD67J0ZMpFIzguvN
	dyAfTN9m5Y7bI5fMxe5KEBWB8UteYOSYd08OPvftZKCEDBwzCPfkbc3p2gd973MC
	yql8VNK8wYK4qxfqpF1KZeiodyta8KxDSDP9J0gpK2HXEvqWvN/IM+XRrWeZn8zo
	6jZT0kCnIH7BSftUvgYRc+D+E2DNDartAI+EflOvCCvNS+YfVgBd+JrBVdZnK9Om
	V7DEVgFNwO2gl+7ZNgPdYg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 40x77k609a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 16:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1723677744; bh=QrtLOWv3YTrzEZE+4Gbkq8V8YCc6iFN/D7E9YxRCN0k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=XdV5to+li7AIv0RZNEmgW8ZAxxxoxtD//Fpe0ClTCyzoJL1kT4MZtprA1DIA3zYXG
	 hGAvBvDaDUXYcIkQ+R34/gRDS+l+r+Gmbllc8Ww8vYjGOkVyZm6XKkBV6mf0OWBHrF
	 Wlc0JvcsKjKF0JrDEBMaMfuWDiQZyNmR7RnFXrfvP1w9IjAN9WiEID1kZxKbabBo32
	 NO2piHJ2+B5xKNTujbkmyUI0T1bvGW8RmOVFccpC7BCqGgdKQfDXS8koGAcxviuNvS
	 3pyJ+N6JfURKqn8vrNepqcnY9MlolcdUCaxGQZKGshNb9Lr5JL8dOlWmiaQt+c81Ta
	 QovHZO3rfFREA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 131734048F;
	Wed, 14 Aug 2024 23:22:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9E3E1A0071;
	Wed, 14 Aug 2024 23:22:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=v1Obo7sS;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1D34C4028D;
	Wed, 14 Aug 2024 23:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArEf7jctr+1MfQPf+9x0CO+6yuItVXN2RhEwlk922X98960Izzpjf2u6XzbnVAN3RaNTzDr+kqeTfQ+2tGZSHZpd6dARegr/4emEVfgz8eSaH28NihA7P88AiQ5KCV78zQn+mqd8BpRl7aBUiBV4hXeZcbRP8azZAz/RQnOfjikcMqwG11aWxlCBKEL0oiVQGIIGXHFj8kD9u18V2Tm0JEXNkrvQ+JIF2IJtKm08qsZNFny3/nyMF4Mx0j6L1YScP1PUE+IG3wiRpsUMWTEIBgSrbSk6efvOe9Va/swwDVTr1ZIOAvIOW5hJI2+HkKS2HdQMW16XwI1zY1fymCLjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrtLOWv3YTrzEZE+4Gbkq8V8YCc6iFN/D7E9YxRCN0k=;
 b=jou7parBs7yvkIL6zr+Od2v2ycCJMsenAZCrWn6Vndll7QHtcV8wRDqv8YfYiYcrNBi0tO4jKuS1MxGbQE11GiYp/7Hygx1IAyKD120n78nMMb5Lm0BSSWxLaGQmmgUfZ63cx380Faa/rAMRTETCue6pPYy0H1JZZRHcz0Q09G8hkMQVlvOGbJoJ0U9GV7jKQJxgvK0Uv+/13B+ls550+ltXQ8eDLJBtzrCqtgjEqqO67xKjUdFzx9wEcN0PNB5v5p3GffGaNwj/bJcGo2Fcg21kuqDQYlI0yPfY0fOgmiGaioYGwPr0UtZUjzs7ZsshKebA1SiDXWfJIKdzvau3eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrtLOWv3YTrzEZE+4Gbkq8V8YCc6iFN/D7E9YxRCN0k=;
 b=v1Obo7sSEzRugL/7AO5vV1XzYDjQUCxS9PnaXysrsbNg7UOtc7CrrnQ+mLxM6VNWqVN9i4aHwWFpdUL6I5Qesj7P6vFNQQTsKYVCKlG6/jHkSDjdcTMLMvjaEnzO+V3GZ18HhFoun4Kl+c/E7lY9D+ZyBCe0brDVUZqF/DRG5fk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB8560.namprd12.prod.outlook.com (2603:10b6:8:189::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 23:22:17 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 23:22:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@amd.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Vignesh R <vigneshr@ti.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Piyush Mehta <piyush.mehta@amd.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] usb: dwc3: omap: add missing depopulate in probe
 error path
Thread-Topic: [PATCH 1/2] usb: dwc3: omap: add missing depopulate in probe
 error path
Thread-Index: AQHa7jNhUetSAW4lBU65XgE4gCoYD7InZS4A
Date: Wed, 14 Aug 2024 23:22:17 +0000
Message-ID: <20240814232212.xnxnaexnhdldsabz@synopsys.com>
References: <20240814101848.67501-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240814101848.67501-1-krzysztof.kozlowski@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB8560:EE_
x-ms-office365-filtering-correlation-id: 58ecf06f-59b0-474c-b37f-08dcbcb7eff5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RlNMRGwzdDVwZ21QRytSd3drSis4Z0RRVWZTSUpzZnhQSEsxRy94Y0xxQWhk?=
 =?utf-8?B?akM2blBXRnRvTXBqN21kRnFBOWJ4bkh5MXdLck45SFFjeEVueHZrVGxQaFhi?=
 =?utf-8?B?bjB5Nm40djllRmxMNXV0WHpjaEd1N240T3h1enRiV2xXaFJsQjA2UndBOCt5?=
 =?utf-8?B?WWRVSnZsNjU3YTdBNFd3bTZVRzVTTGZTUy9uMDhTVG04cVNGUVJTbGhmTFlv?=
 =?utf-8?B?TGozNzU2d1BEYlhFMk0rTlM1clZZWXRFdTBHNWZ0V1NES2t0enQxYnBIeG5u?=
 =?utf-8?B?ckUvVWN4TkVkNVFYU2d1Ukl6bmM2ZWM4RzFtaE1USE5pdEhhUlRsTitHaitU?=
 =?utf-8?B?MHVVWHhsMUUrb05TOTZ5TkJaa0dJcTY0czJQVHJVUkVnUHdweTZBa2RRdUky?=
 =?utf-8?B?dlZWN0hFSEdTbXllK1hjQ2pxOWo3Z0lKaUVjTDdLUXJCSWI1TFBlV1JyNHZB?=
 =?utf-8?B?NFBBZ1ovRWdESXVFSWRYR2wrNEMzN0tRczN2S0gybjBMZ3lQa0Y0c3NuaWMz?=
 =?utf-8?B?M0VTSko2SzRLTnNhTSt0UHc2TXViTC9BZ01aSWY5WWdzcGJWa0N6S0QrOHRE?=
 =?utf-8?B?VWFPMUdWU2JMQXFRNTUwQTlnK2g3ckMyY3BQdEFvbU9SdWEyNnpiZlpiRE5J?=
 =?utf-8?B?U2UwS1lZZ2VXT1ZQWGw3d3RoU09TY0hmYUY1SHNxa01ieGFYdjVxbGlaa1Av?=
 =?utf-8?B?bzRyTWxkWkxBS1h4STN4MjlSNENwTkF3NldUUGNYWi9jVzgraVVTWnRTYi93?=
 =?utf-8?B?VVI0SlZVZyt4cUlONlg4a0E4SHBrd0F6UWUvQ2Z3UmNEZEZLRVFKQ3lhczZQ?=
 =?utf-8?B?WktYNHNCWGY4REZkTGZ3SDdzMmhVQjcyQXFscncxcVZiZ0EvNytuNzBJU2t6?=
 =?utf-8?B?aVRJZnR5WjBNL2FwbTd5QkdrRlVBa3NKY2QybmpnYzdLd0svNnJtS0c2NHM1?=
 =?utf-8?B?OXoxTFVmci9XcVpMWHVJUHZjSmhsc3laNU1ZRUJaTVJjMHdFUmJmTUJmajZP?=
 =?utf-8?B?K3lvWmNZTURmanF1QWVlaW91Mmh0K1RGYlVITXpmQmJRNUp3ZnJKbjJNYVlH?=
 =?utf-8?B?R3Zad01mUlUzWXJ5bC9FdUtFbFdhajF0MDZyb2s4Q1JvZEFlYlZWenZJYzNY?=
 =?utf-8?B?SWlraTNRYms3NDB3aTFzMldxVCs2dlZtSG4rRDFoRXprc0pjU0R4V005UDl6?=
 =?utf-8?B?RzVwOTEySXUwT3Y4NDY0WmF4WVFoYS9VcGpCSVloMlhaWXZQV3N5ci9jaWo2?=
 =?utf-8?B?MlJWUzFOaDBWWHpYd01jeXkzRzlYOURpRVdmMlFhbVlSTUpqamI2VDJZQmNV?=
 =?utf-8?B?SnhBdnRzdFVncllRMUN5aHZnZHY5QW54RjlSdE1nWUI2WWk5T1hEb05jNEt5?=
 =?utf-8?B?cHRHU25KSDJ6WXAzOFFrbGQrdnpFQjh6NE83RG4vT1dXT3BBZlVJK3ZSdzUx?=
 =?utf-8?B?ODFMblNNaUttOHoySDJEbFBjN1dnK0Y1OTcyL3M2VGgwdS9vSXJOdlJQNE5Z?=
 =?utf-8?B?OEtKankybGtaRU9iajRzS1FhT0dncENRTmpKc1NQSW5XMHFEak45eFRkcnF1?=
 =?utf-8?B?ZkxYbzhET2U5Wlp6bGtiR041Smg2VEFpQ0dXU2hIcGI3VGl1YVNhT1BKK1M3?=
 =?utf-8?B?OHI2eXFrZER3ZXBJWjljRUxLdEY2MEZtUEdzUnVRa1lBUndFNEF6NWhldXQz?=
 =?utf-8?B?aFBQTGtmck9CZ0ZCdm93SUF3SC9UVWxvTUpLdjNTK2VSOXhHMzhNV3Z6ZTlz?=
 =?utf-8?B?VS85dFBkcWFXcUZ2dWZFK3FwVGUweWlvUTN2Zk9raXZ6NHUwY2lNMDN5bTJQ?=
 =?utf-8?B?RG93NEgzdlNnQzRpenJ4N0srR3BqK1kxYXBDL29GbTJ3eEJnUzNnUjFaZmF0?=
 =?utf-8?B?MUtHTVFhYlRvWk9qUjFLN0NKQTZlTXVPNmRnZFBFVGNBL3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTZRekV6TnBtTkhnWUg0Zk1UQVM3emw1YmZHVHNjWWpMLzkyZEZOS2JmK2lP?=
 =?utf-8?B?TllObjRVdGs5cFM5NGg0UGwrZ21PRlJtNXB5LzQ0bUVGQjVWOWtEb0EwT1ZB?=
 =?utf-8?B?M1JicjZ0Q00wVG14dmcxOHRoNEtKMlZoWWZzTWhFK1Y3WnZZVlFVeU85eVBY?=
 =?utf-8?B?K3dEY1VOVmlQV1MwWjBzZmZsRk45M3d0ejJPcm5jSm92T0ZOS0hUakc0dS9t?=
 =?utf-8?B?eGEwcWRUbElHWkI1WTJaK2V5WHdOU3ZRYUdZeHNUbVphY2tuMEN0RkF3V0k0?=
 =?utf-8?B?M2FOOHJvaTF6UE4zRDhSTGVRMXVoRHlMS0xvUmYvOHdSTEFpVm81b01OVnc1?=
 =?utf-8?B?eE1Bd2t2SzZMMXk3R1VNYVV0aE5yREtLMWZBbk92TUJZZjVsRUJZN2N2aGZ0?=
 =?utf-8?B?OXhERlhZUzZzS1VjeE5RWU9XNTFqSXptcWJ0eW02d3c1WXNKTGdmZys3clRi?=
 =?utf-8?B?M09aU3Zaand6dVZMWDJPQmRQWit0NEhLNXBvRk4zTkpPcWUvL0t2d2JVT2F3?=
 =?utf-8?B?ODhINnh1d2xWWUlyRnRmTkozMTFRcnJUOGsxSDBRRUNFanJMQzMvVHlMd2xm?=
 =?utf-8?B?dHdsWGZ6clo0UjhlamlvRW9nTXRrZW9VWnhVNTFMVExvQzVzaHdReW04ZTdD?=
 =?utf-8?B?Y25DeERBeEdlSkQxY0lwRkV4U0R6bjAvUmJ0SStMVFYyY3dCMWNaR2dVcmpC?=
 =?utf-8?B?dGFPaXZKZEROMTdYYTVMbnZ1NXVpRS9NYVR6MjZQeXNHRVpCZ0Q3MlhDR0Nj?=
 =?utf-8?B?R25kYkk0cFlDZmtDMXdJZWtFRElJM3psU2RHek56MU1TTEswWTlnQVA0Tmlw?=
 =?utf-8?B?K2l2MU1XenZVSkJwU2FRZEJXR29ybkdqNVlMUnY1eElqYlZsWHMycHc2L1A3?=
 =?utf-8?B?UDFESTY5a0VoSUxrL3phNGxCdFdicEpPUjhqZHFucFBVSkJoTU1JMzBKWkg2?=
 =?utf-8?B?eURESzdzRVh5aldLbW9TUVNubHpDNkRncGcwNmF5VUlQMzNHcm0xQ1N0RDN1?=
 =?utf-8?B?UXRDQ1BYcE5uc0tZK1lrWlZUdGlZVkNUM2N3Y3JXSlp3SjRnSG5yNjVsanow?=
 =?utf-8?B?TzJHZGU3RXN1ekFjNUlMcys3MU9TRTN6aFk4QlhRUUw2c20xQmFiR0FLN2Za?=
 =?utf-8?B?RlNscWFLV1lOd3RxajJzREcwalFUWWpzVXNnQ0JMMXVvektHQXhxVGhPWTR0?=
 =?utf-8?B?aVNuWVZDd1J6TmdMeTJtQkNiZ3ZWMnFucVZObnFQUndGMmJxa0pGS0dUZ2VU?=
 =?utf-8?B?YmtDaGR1cW1CbjJITEFsaXlUVU9Za0NDTDUva1U0aEFkTy9mYWVDb1k5cDU1?=
 =?utf-8?B?MkQ2ZUZDZ2N3M1ZqNEFxRS9lUTd2TkdlTW9uMkFLUHFWTG5zR1dFNGJMU2pr?=
 =?utf-8?B?SEk3b0tvY3l4Mzg0RUVzbjQycHkxZWlzSFlyR0pkc1BwbUFncVhKS0YyUzEz?=
 =?utf-8?B?amlWa1NnM01pS0VpV2Rkemovc3RtYTdkaDNOQ0ZGYVplaU13TGppYnlTZ0M0?=
 =?utf-8?B?MFBib0UzTmJwZFAvU2JkeGRIQXpYVWh0WU9kWmRZazJxRGJHeUx4bk5tNGZ4?=
 =?utf-8?B?OGhqVzQ2SzFXdk80NGl3RmQrUW5LNm01eENaT0F0YUJFRUcrdU5IZjdtU2NW?=
 =?utf-8?B?ZTZQYVNyVGw4VmpPaVJiS1dpcHVpbW5iRmRyaVhJOHhBeENzNG04YzRjQS8y?=
 =?utf-8?B?THkxd0gvUTFLMFZ4TnlQZVV0NjMwZjhTa0NVMUd3aTZGQ3Z4S0ozSXFpZWMr?=
 =?utf-8?B?YU1wRlJ6WnAyQ25SSUVvQ0J5V09qNk8zN0JRYmhWdWQ5UlpXNHluSy84VjEy?=
 =?utf-8?B?SkVycEwvVmpoeDZqS09zdXpnc3hnNjJzeVJ1V0VuQlJNUTBGTFlOa212VHVr?=
 =?utf-8?B?aXYxWGMxUzl6WkdSSTA0Ujh0UzI1SHUwMmNOZ01yZ01iWm9IYzF1UGlSQ3RX?=
 =?utf-8?B?TGNhOUdHQ3MyOWhXaktYUkRZZm9oalloNHI2TllKNXhIcWpvN3hrT1lJOXl4?=
 =?utf-8?B?TjRWY3czZW8vNlhSeDdYSWdqZUVGRTJJRkRmdmlNTXQ0QjdCM05IS3BpTDJu?=
 =?utf-8?B?ZUMwMml2aG5uY2wrRWpTZ0tsYkc5MUR1RklFa3ozQ0NaTFB0ajNIQWxQNitX?=
 =?utf-8?B?ejNyZlEyaGhJSW84eUdKdVN4dDhnaHdRTkFITnNNVytoclVHMmpKN2cxbDRz?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6DE166AC33CF34382F7187B3E4B6C70@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	91mhJTPpYpWDa+o0o77cs7x8WcBebUKlUHYC6zghZc7BumljFUelAHdHwMQcxRH0ubRJ4gR3/b3O2LSukqE8ev7hFkM2yPMJiSzfcHT/+RLO82VFztInKCsUPf3q9vgaKbtB5VcUJh+AWhLTs0y1AcLE3raeXAK71wZeLsZF+ARSUsrJuDaViENJsmN0j4o7Y3sSzC4G5dz1vgYDwvyqKOznhYSos+MCij9PExtDko3pD0qgkT7N5s2+D+s+cbmpzqY1EuiqVN+CKEjMX9LanG7vFoGEB6Fd0f4P6tJGfs9u1cJUvVTOcJ5dUYSlVELTNC3BEDz3XnPlXSwwAnURd6id3IN2T/QPoChPudx6Vw2q9iLZpPtMGycuTHGUYAV2cWM/Wc0QR3CoQ9zRlvmFvx4aImN9vJjJ5iNse8bTbfvp6MNx7p1/GZGfuG7wNGU0CoNePlZq2AZxtuynOFx3uvdhutWPpA8b56tdJ229JP3w31KlDImxPWT0BO34mjEqftK9KBHNrPDDpHpgF0/vOzZPqhpeOf+HwelsebSCk2041oqMSlgyu33H589SPYT++oP2SDuIuHK31T9449TkEK7CQPKANCqzrRGDM9S8c3WOrMfycPl1vLoYM0PYU9iqiHTHCHVDnATpbOfn7c0U7w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ecf06f-59b0-474c-b37f-08dcbcb7eff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 23:22:17.0268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mRPFmKA9ZeaTF3btK8bFtVh+uE2HTpB0w0lhi6bBDvkjrEOdkqRPSxd3nG6iyQbrQUJVmJPTT+Z0azU1u5aAtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8560
X-Proofpoint-ORIG-GUID: pXpkt1hLkTA-uNRP1N8TKw27vvPU5Xcq
X-Proofpoint-GUID: pXpkt1hLkTA-uNRP1N8TKw27vvPU5Xcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_19,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 clxscore=1011
 bulkscore=0 suspectscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408140163

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IERlcG9w
dWxhdGUgZGV2aWNlIGluIHByb2JlIGVycm9yIHBhdGhzIHRvIGZpeCBsZWFrIG9mIGNoaWxkcmVu
DQo+IHJlc291cmNlcy4NCj4gDQo+IEZpeGVzOiBlZTI0OWI0NTU0OTQgKCJ1c2I6IGR3YzM6IG9t
YXA6IHJlbW92ZSBJUlFfTk9BVVRPRU4gdXNlZCB3aXRoIHNoYXJlZCBpcnEiKQ0KPiBDYzogPHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3Vz
Yi9kd2MzL2R3YzMtb21hcC5jIHwgNCArKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdj
My9kd2MzLW9tYXAuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vbWFwLmMNCj4gaW5kZXggZDVj
NzdkYjRkYWE5Li4yYTExZmMwZWU4NGYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1vbWFwLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9tYXAuYw0KPiBAQCAt
NTIyLDExICs1MjIsMTMgQEAgc3RhdGljIGludCBkd2MzX29tYXBfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gIAlpZiAocmV0KSB7DQo+ICAJCWRldl9lcnIoZGV2LCAiZmFp
bGVkIHRvIHJlcXVlc3QgSVJRICMlZCAtLT4gJWRcbiIsDQo+ICAJCQlvbWFwLT5pcnEsIHJldCk7
DQo+IC0JCWdvdG8gZXJyMTsNCj4gKwkJZ290byBlcnIyOw0KPiAgCX0NCj4gIAlkd2MzX29tYXBf
ZW5hYmxlX2lycXMob21hcCk7DQo+ICAJcmV0dXJuIDA7DQo+ICANCj4gK2VycjI6DQo+ICsJb2Zf
cGxhdGZvcm1fZGVwb3B1bGF0ZShkZXYpOw0KPiAgZXJyMToNCj4gIAlwbV9ydW50aW1lX3B1dF9z
eW5jKGRldik7DQo+ICAJcG1fcnVudGltZV9kaXNhYmxlKGRldik7DQo+IC0tIA0KPiAyLjQzLjAN
Cj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+
DQoNClRoYW5rcywNClRoaW5o

