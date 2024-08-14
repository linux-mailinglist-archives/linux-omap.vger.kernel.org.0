Return-Path: <linux-omap+bounces-1910-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C995952637
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2024 01:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFF8FB2316B
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2024 23:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC3914D2B8;
	Wed, 14 Aug 2024 23:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OrynzF41";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lO3TcAQD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nHUXrG3T"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF5E1F60A;
	Wed, 14 Aug 2024 23:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723678310; cv=fail; b=Bj+ayG7RJYjq+2OaC9U+27Pz0jdFy4TqMm/crh+6GyvAkV4yPgsA8n0SA7/OuV1IasmAtiRo1XNmQFiYHYLU8EBYrQ5S+TYLtfIGa9vgkXcxGgQ+D9lHCYdTbEIX2r5a3NATGAeCww6q7F7HbmeE4HJO8FAZC2fnSBZmEtuwoL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723678310; c=relaxed/simple;
	bh=YoRzHebRY5585HSH3J7B8ilvwkCkG6Tto0LnyFthbsw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aWqLnfRHNRUulXAJFfZ4XeEI4NRa8iTKqP9WnGHrqmLURn14DkvSqi6ASBh6gdLb7l0O9cbVMfwJytbfSF3L/1AkOoazNk0abACLKHPLHj1mwDjsW2uyeDm5NEAe/3+qGqPyhojNtOHNJlO+1OHQaZ3K3If8Xxo+B/in5eryAK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OrynzF41; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lO3TcAQD; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nHUXrG3T reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EHs4t6001630;
	Wed, 14 Aug 2024 16:31:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=YoRzHebRY5585HSH3J7B8ilvwkCkG6Tto0LnyFthbsw=; b=
	OrynzF41oDmuaAK5gJOe2OY5vNTVdnH7jnV3Q2nF7MCLNPkWAxf+waZk3xkWBkN8
	bvKJQaY+e/MX2WGS7XhjCj4FPUX5rEHxllBsCJ8GyZ+SOlB7YkBlPfuqoQ2PjKUD
	2vnFdFvfMknWB7YHcNb6UMdnOp7lWEuo1wkDPR7YZ1p/zD35T2mRf6zi1ns8S1fE
	j8/Zrp/qaWSbadV93mePdhm6tZiFOr5TVpBeHK6BCQEFG/N7AJMd3YqXdLy5PUtb
	wMghC6G18sOde645yXRnFCQ6ozwcI6X2ps6jSCIqo/HvZ+07PkEQysJ3rCRZ9dlF
	2mopoKww6fkNaA11sPYLhA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4111cr16cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 16:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1723678290; bh=YoRzHebRY5585HSH3J7B8ilvwkCkG6Tto0LnyFthbsw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=lO3TcAQDBvFeeoQvmQd0uOlZr7qpGe82krjRugN0UYUfYSSe0N14tgPhb61YLelsz
	 hgmhEqDtxxDEwb4hWsvC0emqJfTXYIZJYuSN64laFcmkSqVoCnWUS+MYEDhf/624QR
	 OIwvNZrwdtDuHjJrdsmekR1VFrkJh1AL35DlX+OrioMgxv8BTBEigSJI5Qh78zsyKg
	 yshJzw0reSIISaH3cF5wwm+bFlPmjlu50mCbs7rYFqMA6W4zcmMs1gm2GzupmVaU/F
	 cJG7UHcQ0eU9YyxQtNmtIdVjJhIGd8eYZTGG7mshcxdDLqWG+JeHKW+JTs9jdZhnQ3
	 ZMd4aCQtktXig==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E1B4940407;
	Wed, 14 Aug 2024 23:31:29 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9453FA006D;
	Wed, 14 Aug 2024 23:31:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=nHUXrG3T;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 39E5B40601;
	Wed, 14 Aug 2024 23:31:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmDSpFUu5dPyvBlyp9GGshvIHOOuRt/siZAxQyCDdczNssoVL4JiDx7fk/BWIRsJNJ3Y/TYCQC9/VGM7RCznbVxBMyuAs0IRkM/CbJ3q9Em5zx9c2IB3qEY00BiqlcXgaDb0EivfF2ZbWc3DEC6Sk4dlDgOxUnx2aLV7IU3DkGxxU4cCC+x5Uvg6Z6JdAgXynwfxyWJvkhieufEMliMoxCdwSfD3xQqFxtt3yMfUcEoc7h3b8K/C70evPo1N5wcJ/5g3bwqygGWeXtA+PQmAQB6EdqwvmXOgXM0dUrKb3X/RKDyJ2bYwvhauxkNtbfZEtlszQzjauRlQAHUq1XVsPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoRzHebRY5585HSH3J7B8ilvwkCkG6Tto0LnyFthbsw=;
 b=LmCNO2GRYkbp4FWjugLPYx8b6CrkIKArZFBTIN4MXBbQTBJTrmR4UCPU3WwVW6pgB0RP7M0IK5CPYmD6/N/tuCuq3WnFuwac8PpxM4Dfy4er5XAW6cJJMwYomLhIx6QXVxG/1hFoXtvUGpZtr7XxTEPpSTpAo7nar8u2lEb7lUnFrQdp8Hmy+j9rOfVJIwc6g1QJZrVtcgOBVulR3cIfT6VL64cNgRLtV+xWlEMr3NqcGf2OXCmlyYO4E8iFZvV+n5Di0DMhH7PYowaWHYcwXZSJGea5oPqttTUFPk1LP4T1AlfguWGdqgodP2V9nr9Q6psW7KXvQPAj/cvvVrRhlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoRzHebRY5585HSH3J7B8ilvwkCkG6Tto0LnyFthbsw=;
 b=nHUXrG3TJxPVSRLG3XJbHtCrnDrSw6514gF7c1swlhAPsBKuBedbqDmCMKpCFgd7oPn8Luh/InNcS0Bzsxsj+zjeylOOv7CB1lNNCiiuBF4vLJVmvVPPfAy2wBOupDEN+09s3DoGczcSxo/0MOQVvT7foaTfO1EER0mBUBIJAvs=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB6590.namprd12.prod.outlook.com (2603:10b6:8:8f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Wed, 14 Aug
 2024 23:31:26 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 23:31:26 +0000
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
Subject: Re: [PATCH 2/2] usb: dwc3: xilinx: add missing depopulate in probe
 error path
Thread-Topic: [PATCH 2/2] usb: dwc3: xilinx: add missing depopulate in probe
 error path
Thread-Index: AQHa7jNorQEmBn/nRUCsZXi1PTAUs7InZ70A
Date: Wed, 14 Aug 2024 23:31:26 +0000
Message-ID: <20240814233122.i7anp7a3p5xnl5tt@synopsys.com>
References: <20240814101848.67501-1-krzysztof.kozlowski@linaro.org>
 <20240814101848.67501-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240814101848.67501-2-krzysztof.kozlowski@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB6590:EE_
x-ms-office365-filtering-correlation-id: 4dbaaf40-ef6a-4c03-b1be-08dcbcb93790
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M1lGZ1FEVU5iejRrOFFOTzBTNXdiVzFPOWg5YUk4Ynk5LzFMUzRoMEpaM2R4?=
 =?utf-8?B?c1cxS2JlbFYrWnVTVEl5RDdoeFFEYVhqRzR2bi8rVEpiMnBjM25oaXJiSUww?=
 =?utf-8?B?L285OVl6eko3U1BSTHBDQTkzMnphNE11RHpmTzQydVQxaDRzT01RTXFNVnRR?=
 =?utf-8?B?MmhaTEdzM1dvZUR2Y3pMdU9XSUtnTG5DeHdFSUhXTEFGYUh3RFVabjBkdUg4?=
 =?utf-8?B?WUxjY2FoQVI4TlduT0o2MjQ4dCtzbEdsZ0wzRGVVdHh2NmRGUnB4Nit1N3li?=
 =?utf-8?B?M05GOHNtdTFYMFdscUI5eTVCSTVEajQ4SUU0THQ5eTFRQU1nVnE2VU54aWFo?=
 =?utf-8?B?T1R1NWRPNzVjYXdadFZxZHZCVVQzdE1TNGdQM1B0MjZVT01qSUtVMFRRVXFM?=
 =?utf-8?B?cUdTUXpDcjB6Q1Bxb0p0VmlTVmhEL2VRd2hnc3pOM1ZkajgzVG4wNndxRnB4?=
 =?utf-8?B?L0cyQTZ3M2VDcjRhaERXYk1vS3lEZzZHWGdFMnpBZW00Q2VqaGF3UVZxK29U?=
 =?utf-8?B?TExHMEhPaG1HYXJyWmJDYjVkbStBemsydFRJbW85bndiZlF1MzFOdTZ1aVVn?=
 =?utf-8?B?UmpnU1RxanhqRGs4bUJmMGZ3a001b21BeFpCK1NVazdyN2FGZ1Z4bnV4S3dK?=
 =?utf-8?B?UjdEWHBEWG9YN2FuMGIwdkxEaWNmcTVucExtTE5uNm5DQTR1MDVwNWxuMkgv?=
 =?utf-8?B?T3ZHa0hQejBua0xROEliT29JUUNheklQT2FCa0lJUHc1OFl3a1orQVRwY01Z?=
 =?utf-8?B?UzJKbzJLVGZIYThrL3BKalFiSHN6VVJWYjVrZU0rMHg5aTBSK2l4UEVGay96?=
 =?utf-8?B?SXFWeFpJSHVNemRsZEQvaCtWWVk2NFhqOVVBWXI4SmVMdHJ1WmR5NUc5N0xv?=
 =?utf-8?B?WXNTVzRXaFFsa3hWQndxc0M5NnRiSmgxZTF5MDh6Z3haeVpMRmZTWUMwblJi?=
 =?utf-8?B?ODRWNTFBM2Vzdml6SFFhYVBxdjlEeHhLb0xvVDFXQXZmQWN0N05oK1dnenY2?=
 =?utf-8?B?Z0FLcnU1aW54N2J1ZUhMSUxWaFphQlB2U1paRmJ5YkpkeEVscGF4MXpCY2dC?=
 =?utf-8?B?djYyVGw3ODgvem9GTTRUeVhsdlpXZHZDaVZIWlJFTU8yNkFyMTA0cjVNOXB0?=
 =?utf-8?B?dlNoZXUxRzBRMjlEdzJkTkhSUXMrN1UzMGlFbUhCZFpQUXcyS0VWQmh0RmxE?=
 =?utf-8?B?c3MzcWp5alZ6Y2hoNVBIMW1GMENBdStnb1NwVkxWdFV5RmFheFU4ZSszQnpX?=
 =?utf-8?B?ampaVjhWUjR4WnQ0Y1VndnU0c3pMaTY5aWRUQTA2ODJwWGhuc0YwT3NFK1Br?=
 =?utf-8?B?cG1LbG8xWXZndVRncXhzYThnQURJRDdvQUhDMWdwa1NiWGo1b24rbGlKZmdF?=
 =?utf-8?B?MWkyUFVVOE9BRGg0MDRnZWo0aE0rTEVoWXRXTW1Md1h1VklILzZ6RGEvYk9U?=
 =?utf-8?B?TXNlanNNVUFMSUk0bHMyT1VFNkpBQmdhazNoS1Z1eU5QZUlHWUxyK1pWNGRr?=
 =?utf-8?B?c3AzU0FBK1FEMTNYcmdKVExveXlIMGlBNHhmOC9zMko0QlpPd0Z5aFhvNkQ0?=
 =?utf-8?B?SUJzdmFDQmVsTWhWQVV0OGhZZXdKajhPeEwwSUxjZitleXc4ME1WeVdDWVU0?=
 =?utf-8?B?OGh6TmxORUdzWnJzY3BwY2N4V1k4WWlvM0QxMVVZUE83Q2RWQnE4Uko4RFA0?=
 =?utf-8?B?aGhuS2xKN21xcHp0eTFMbFdaRXB6d2d6TDE3ZWtUV0FxNlhSRi8wZmN4OHlq?=
 =?utf-8?B?Y05rT2lkVG50dGJUc0prUGNRT2ZEdGpZaWxzYjBOSXNnNkZWU3NabW16SDdP?=
 =?utf-8?B?MVp2T3pRSlA2LzdUYXJoSHF6eDY1T240VVdqNkJCbENzUG9DVnRNT21yWlVJ?=
 =?utf-8?B?WXhXWERiZkZ5VXFHS3J6VXNBVU1CakgyM2dRQVliK1k5a0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2ZCK25GZlVzZWI0Q2pzREpEOWQ2NTJCWjQ4ZW5XV1UyWEFycWFDVmxFcGRL?=
 =?utf-8?B?alpKYnRKK1lYbHBEYnlJenM4VHZxeHpNckcyZ3dtTHNadEQ1eGk1WkwvS052?=
 =?utf-8?B?Rk1zODZlT3YrR1JzZE9OdGMyZVNrdXVHTFhmczBiYllaU1ZIZnowNmtVVWkr?=
 =?utf-8?B?TWJUYkNtcGp0YWRoeWhqOTJ0ckZ3Y0FoQkltRE51ZUpGR2pxZktETitMZG9s?=
 =?utf-8?B?L0phQkpZeFJSY0FRckxCTWhOVFcxWWpiK1EzMy9zM3hYUEJaK0h2emNrUTIv?=
 =?utf-8?B?K2d3enhncmhaNlFPK1RocVg5UWluZkJkYmZVOXZ4Qi9GME5JUEdMZkxDTDU1?=
 =?utf-8?B?NytxODVpc3JsQm0vdDBSZlFkNHhnUUlVRzQzQUFoMXBHaU8vUnlXN3dBMjd2?=
 =?utf-8?B?VmpVN1p5bENsTGh5T3F2c1YwNmRudDJpNkxRZnBEa0haaTlJelQvaHBYSytp?=
 =?utf-8?B?ZlNvUFkyeUdQN3QvRTFzNmlrZkppU0F4YWt2WHplT3hIMmtrQlpOYmNLMFdy?=
 =?utf-8?B?ZWpIbTdPbHFQSERwb3lNTEtXNmF2MFZEOXc3dkUydkhrd3NBTEtyUlBSOVp1?=
 =?utf-8?B?V1N4UnY0Zi9NS3Y3NjRHRWgzcnFiM0lMWm1mZ29PRUlldmVxb3UwZURlRDRY?=
 =?utf-8?B?MEYxZ3A0d0JYcHVMc2VGZTZPakFRZ0d1VlE0QTM4eXdUNk8yOTZpRXRDMmti?=
 =?utf-8?B?d2NZajRCL21tQk9jZTNUZkMxcnNhd3dodU52cHRLbHFVLzNXRFlrSW11OUFQ?=
 =?utf-8?B?VG5GMmZpSi9mREkzR3dDdndVa2JTeXdFa1g0OUtTbEdGQWYzV29DTmJBT2lC?=
 =?utf-8?B?ZzFFeGFrYlZVTW1ldHZmRXJhQ1FyUFJNcEhpVDVLMGdHQ29WaVJKdXZVYUFF?=
 =?utf-8?B?Mi9WVFhhOUtmUVEwQjNKSDd4ZHJxdVhHNmJJOXo2bHBqSXNsanJvSytkRktC?=
 =?utf-8?B?N2VXUllmMzF3b0ljeXlEQVpUUUxaZWhoemZGcVk5T0E2YVlNTzRwUzM2c1RW?=
 =?utf-8?B?Y2diSmJnb3lZYXFVZ24xbkxNWHBEYkNRREpubHdwNmp3eGREd3RJaXozMndz?=
 =?utf-8?B?cGpRZHk4QittRDlvSldJOFg2MlZDd01QVlB4MVloYThuSXNHVWFsRkJKVDNv?=
 =?utf-8?B?N1J4RG5pY2FDanJQZHhVcGg2dDlheFNITVJhZGZhYWY0T2dTN3RsS3hVcXZU?=
 =?utf-8?B?K3NDWjIzMWwyQ0E4RnB5K0RlMFZpMElEendESzEzVFRFOXdmUDhBTDlmQlh2?=
 =?utf-8?B?MTJ1OUJreWpNRnlGRllHVHczaTJqMGVoaXhib3BreEZiemJMWkNodHoxWktX?=
 =?utf-8?B?N2dydEJwbHJRbXgwUldpU2QrWi9YTlM5aW5OWGRLME5TRlJLdmp4OExvQzls?=
 =?utf-8?B?Sk5ldEtFK3FZVnd5ZEY5RXkxeGc2RVNPU3NtdHRsVWtiNzZ4NlVNODA4alhv?=
 =?utf-8?B?ZW9zSFVvMU9kTWlKNFZKSHp1UFVRMUpsU1JiZW5pancxUjN5MXREZXpPUkZR?=
 =?utf-8?B?czdXclJjaENNT1NCcEFxRDJ6UjBhU2UrM0FYbC9BUmMxWWM4aFliRFdKd0Rk?=
 =?utf-8?B?UWRwNHpkOENBd0VkdkkrSFJ4V2J3M1YxNzhlUFBwODRKeVlRcS94Q0lZSWRn?=
 =?utf-8?B?VTNRdWc1YUU2NFRNa1IyT0pEbTY1eVVlOHVpb09IejRVWEdtSkJpa3pCNjdr?=
 =?utf-8?B?MWRudE9PZ3p6S2VQVTdneGlHRU5GTEYyMXJTbVl1d3VFMlIxZFZ1MndZRU5E?=
 =?utf-8?B?Vm9UTmplUkxYZ0lIdHhFaWREWTI3clZTQ2RJU055VTdJa1VwdGV1R0pnMDBq?=
 =?utf-8?B?SkpTVW03eExXL0VwZmVoSE5JZld3TVo0R0NEeEpRQTlXbnl5Q2luWFVGRXph?=
 =?utf-8?B?aXMvRURobi9vMWNPTGF0NTZLeThVSHpoSE1ubkZvNFphaUtOd3E2MzZhR2JB?=
 =?utf-8?B?Q0lSQ0FHWFIrVDBUL09PYjJDcE1WWnhSWUcvemdBcDg0RGtvSnF6Ulhab2xQ?=
 =?utf-8?B?MmV6c0RHQlo2aFl3VTdSYm92a2pVMkRHOGYzb0dFRE8yY216UDhrNmtXUm1z?=
 =?utf-8?B?R0VhaW1WQXpTcEE0K05lckp3bVc3d2NmWG9Gb2Rha2pRZWk1MVJvRDAwdTRs?=
 =?utf-8?B?eG9LcFhhbnhjOEk2cWkzMC9XZ2J0WUpiZ1ZkL0Z1Q0s5YzErMUpYZlBlbmVW?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCCADE8999D39A4FA976B8376696CE84@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HCxL/6a+giWQl1nsiOyV7+3MzCD7YhtB12aa+chxq2uORhUq+bQvsY3vuRvI/mz7FxkVUynLvmdBzgCasBx8nNJ52nq8wZHswgiqSRrBwFosJpG7DYh1AcEura7k6R5Oy9uP3hXKrcieHUL+xWfP3XNq9teVzlaRPWplhbpxEVas2BQJeRvwsRShlMXy/EiiyHlVp+xT7/6X0EjyfDIJi04rWERedTO1n8eO9ax9In9b6Lkhk65mD6+Kcp+KAFje0VK3FKm+QhKJgsu/EzWi6CLQazadyGTUNi5IrPyf6WzZQ5G0RGy6aHE8Ps8BbRqd8FLz0W5kvwHBUmU2+uFQ5JMYIH1x7947cBJbsP6NaojB8Gbck43R8JIkFIXDxtIrmec4uW2yyPiwfk1K/rnDFEyUPCaqtwGlwL6P4QlVKkT3dw4DGd55CDKshkX+bgLu8av5JCjr3l3aRMixMGS2Y8lyma8mL0ptc8TaQ1MfjqWnSCie9geb/tOf0n6hTDMVyiTUTye2fQDgewsU+CwB49Ym+mpcx/InFcItrsNRnspXja7bIf8ilFxOqcaC4BEAWWW2rx+1pjLDrurDqihlIL0YlpGaDrAsv2ouphmGbvtZp4MrOXULEXM1o55/QDjGpY9Ak0PQL+mcV4xrFimHwQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dbaaf40-ef6a-4c03-b1be-08dcbcb93790
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 23:31:26.6676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sI/CJ36ha1Yx2x+KpU4Klp1hwIC+/sGJw+KsJUIHmoTLfGa5OP0EzsRRu8E6zzZm6i2HKH096qgpr6gmwfpd6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6590
X-Proofpoint-GUID: BfF-N2XI7zZajCGuLHzMwbY8JK5wNB3_
X-Proofpoint-ORIG-GUID: BfF-N2XI7zZajCGuLHzMwbY8JK5wNB3_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_19,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=722
 phishscore=0 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408140164

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IERlcG9w
dWxhdGUgZGV2aWNlIGluIHByb2JlIGVycm9yIHBhdGhzIHRvIGZpeCBsZWFrIG9mIGNoaWxkcmVu
DQo+IHJlc291cmNlcy4NCj4gDQo+IEZpeGVzOiA1M2I1ZmY4M2Q4OTMgKCJ1c2I6IGR3YzM6IHhp
bGlueDogaW1wcm92ZSBlcnJvciBoYW5kbGluZyBmb3IgUE0gQVBJcyIpDQo+IENjOiA8c3RhYmxl
QHZnZXIua2VybmVsLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3
YzMvZHdjMy14aWxpbnguYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jIGIvZHJp
dmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IGluZGV4IGJiNGQ4OTRjMTZlOS4uYjc2MTNh
MTA2ZGE2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IEBAIC0zMzAsNiArMzMwLDcg
QEAgc3RhdGljIGludCBkd2MzX3hsbnhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gIAlyZXR1cm4gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYpOw0KDQpJZiBwbV9y
dW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgZmFpbHMsIHRoZW4gcHJvYmUgd2lsbCBmYWlsLiBXZSBz
aG91bGQNCnByb2JhYmx5IGNsZWFudXAgaW4gdGhhdCBjYXNlIHRvby4NCg0KQlIsDQpUaGluaA0K
DQo+ICANCj4gIGVycl9wbV9zZXRfc3VzcGVuZGVkOg0KPiArCW9mX3BsYXRmb3JtX2RlcG9wdWxh
dGUoZGV2KTsNCj4gIAlwbV9ydW50aW1lX3NldF9zdXNwZW5kZWQoZGV2KTsNCj4gIA0KPiAgZXJy
X2Nsa19wdXQ6DQo+IC0tIA0KPiAyLjQzLjANCj4g

