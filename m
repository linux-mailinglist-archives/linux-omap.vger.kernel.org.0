Return-Path: <linux-omap+bounces-3557-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A5A7EFD3
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 23:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A10C6189556C
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 21:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA43A217F32;
	Mon,  7 Apr 2025 21:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tglh7dQM"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80429B672;
	Mon,  7 Apr 2025 21:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744062455; cv=fail; b=fWQgxKehzwCyJjUU+kxedbOa/7rhiuECT/jnELyz75nXBdpVyYQB0Z7LNGr3UrMIGW4HDFdW5IPoT1eSp9PhgzjJ+nGGzJnZOnH8IyHdsat/UZVefUlBxtPCZJ9A+L19ftLS7XIianVzulADOkFT4FfpQaBhAA/XF0UPOUC+NNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744062455; c=relaxed/simple;
	bh=FiW9qXpsO+hwUwGCO4pMKjwuzB85E5ISMOXlfXK/N3U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DfKK0BTfljQpfcUs4mXL2ue+VVhnFv9UnRxTGGS0LPqLDsUmsZx8dYCbKPH7ravdjWHAFAu6wGl2WC61eNv62TdJSs+uq8/Z9bwBUTj87R15XAH2uQYcyw2MqdBkJ2//EXRyAVnhKb5+GmqmSGU8ybPOw6ZNv242DqAGxsxUfaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tglh7dQM; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744062453; x=1775598453;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FiW9qXpsO+hwUwGCO4pMKjwuzB85E5ISMOXlfXK/N3U=;
  b=Tglh7dQMg8A0Gepb7SGfXKVuUBo3hJZAYnvJanG8jzHV1+OwCwXJLS8m
   r/PyBOOdJ4xtj1zDuQMTKPyt/MNfNBUzZY8wIcGeqv5G6QTvN37AnIHVE
   71HmHPXyOo+7CKPaXiJx8oz7uN+U8DIfUFfh2O1jWGpLx35d/TFdiMS/i
   h3AzIBaxJ8kPsgvw+L/+7ah/d67jXIOAPN9+IFcuGVwbVrVGx8EDNiEfy
   oz4znhAL+HGL2G7KJ+ln7KX/YxTQP6BW4yV7w97Zr/tdwqUS2GuUaH1yV
   KWhwtCStqE09ozJVQJGwHJwDrGDn8JRbsqbFxcDXoY/YkcCxjWEJCF0w0
   Q==;
X-CSE-ConnectionGUID: Lnk/9dzdTgqR4l3Gh4ecLg==
X-CSE-MsgGUID: CC1/cOFrRF+l3FUXUPRFNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45591043"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="45591043"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 14:47:31 -0700
X-CSE-ConnectionGUID: 70/Kf7J7QWmr+bPZ/88GZw==
X-CSE-MsgGUID: yr7xBERpRim7/1OaUKUk2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="159070839"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 14:47:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 14:47:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 14:47:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 14:47:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYLgvBxAjqF+l24dHEmteNLFuZkzVfamGE1DIs7lHOF0RIeMJqO9Gbgf4pEcngaH+7KMBt+Apb8/NBKErE+dxKHo2vYgzK8EgEbPMOmMOBFCQP5KVQHCJcj5hXB6aogUV3RxiSB2QXfq1ra8HACKn+sNRkX9roSDEQwWNoNzc63EfTUqREyL+WuFI26AbOdlFtB3v9touusGjaZoq4vsSYCs4pOscJE36Iv8iymaBaWSgjJinWyM9Zx+rzaWF1WoHH8Jq7sponEpshzpVvZxYXc0IYCs3gi9AcPR8zlFtguzxTLepk3QAj5x3LEAhwpQxVvqpen3aUQT/LMU8mXULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LuwERblZ1vgrW4dMdFdH2lOIqi3ES01ieiLAzl70Do=;
 b=fe48A8E1qjMdoX0Lemu8oN7XJ9iUDujcJ7DYMogFFMKLxwCH/+1XYZIunc8lIZJMbNYypMf4tLudYl3g922hE3JRu6XvE4KnEKnc22RFt/tmSQMDUGk5tvx+hTFne0E1F78fnH25tqxJjzqkxp1GMJs1WZF4hods8Q3mgFZNSkp+hbbfZOZdlGD1U86Yejnn+NeVLXs8i06PnqBj1LmQm+PJ/4GeEB3LhVoWTivxVpfz1hc74VG0I0K7Tx+T0+Kvw7J6eBf4imb+8musgmDG2JqzvGT4EMZZVm7X3N/Ub4AujFvYLAEeHaUhbk1b7gSr1VNkrS1dv+JxZz4JF3ptEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by DS7PR11MB7836.namprd11.prod.outlook.com (2603:10b6:8:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 21:47:10 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 21:47:10 +0000
From: "Keller, Jacob E" <jacob.e.keller@intel.com>
To: Andrew Lunn <andrew@lunn.ch>, Parvathi Pudi <parvathi@couthit.com>
CC: "danishanwar@ti.com" <danishanwar@ti.com>, "rogerq@kernel.org"
	<rogerq@kernel.org>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "Dumazet, Eric"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "nm@ti.com" <nm@ti.com>, "ssantosh@kernel.org"
	<ssantosh@kernel.org>, "tony@atomide.com" <tony@atomide.com>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"glaroque@baylibre.com" <glaroque@baylibre.com>, "schnelle@linux.ibm.com"
	<schnelle@linux.ibm.com>, "m-karicheri2@ti.com" <m-karicheri2@ti.com>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>, "diogo.ivo@siemens.com"
	<diogo.ivo@siemens.com>, "basharath@couthit.com" <basharath@couthit.com>,
	"horms@kernel.org" <horms@kernel.org>, "m-malladi@ti.com" <m-malladi@ti.com>,
	"javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>,
	"afd@ti.com" <afd@ti.com>, "s-anna@ti.com" <s-anna@ti.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "pratheesh@ti.com" <pratheesh@ti.com>,
	"prajith@ti.com" <prajith@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"praneeth@ti.com" <praneeth@ti.com>, "srk@ti.com" <srk@ti.com>,
	"rogerq@ti.com" <rogerq@ti.com>, "krishna@couthit.com" <krishna@couthit.com>,
	"pmohan@couthit.com" <pmohan@couthit.com>, "mohan@couthit.com"
	<mohan@couthit.com>
Subject: RE: [PATCH net-next v4 05/11] net: ti: prueth: Adds ethtool support
 for ICSSM PRUETH Driver
Thread-Topic: [PATCH net-next v4 05/11] net: ti: prueth: Adds ethtool support
 for ICSSM PRUETH Driver
Thread-Index: AQHbp7GUMpxoQbaZ60qmLD3ok6PwS7OYpSWAgAAYWhA=
Date: Mon, 7 Apr 2025 21:47:10 +0000
Message-ID: <CO1PR11MB5089CB4D35150C286EE81387D6AA2@CO1PR11MB5089.namprd11.prod.outlook.com>
References: <20250407102528.1048589-1-parvathi@couthit.com>
 <20250407113714.1050076-6-parvathi@couthit.com>
 <64a3cd3b-feee-4414-8569-01642b127ac8@lunn.ch>
In-Reply-To: <64a3cd3b-feee-4414-8569-01642b127ac8@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5089:EE_|DS7PR11MB7836:EE_
x-ms-office365-filtering-correlation-id: b172c160-0023-4759-2850-08dd761dbfee
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Rn/1bcRDQisH3cqgcVf55mcCm7XzEZuqsFiZ5/e7NeDHAOTxAYGyewb/ibKL?=
 =?us-ascii?Q?6SkSU7fqxs6s6hCkWHl6itokxB9ENq4/CuVyXGcH0NCbXGk6UGanw8GlX6w3?=
 =?us-ascii?Q?jY8lfiUX6iFGqSL4xsVIY9QpUrBy3b9FeqUxX8Vbir2MS4kjeINoTmbFtCwG?=
 =?us-ascii?Q?VXXnEZdtIp7YyXl4df7PCT5P85UjQ5K22NhHCX8mGha7w6rz8kIuG/HwkGue?=
 =?us-ascii?Q?yfWPgb4ycJd17MF7DSSQup3WgbeLBGNVFsIrejs5XKvxKHMXHroid6Ek15aw?=
 =?us-ascii?Q?eW4rrLnvQXgNnSIbpfd07itqp4uNdJyFY8P26eT9UG06gRnG+Prwc2d4LKc2?=
 =?us-ascii?Q?rcX4z3wCkFQxIqPqjnrhLE1KEbImWHwlSnoF/rvi/qkq4IMFpaWDi0P0Tvk9?=
 =?us-ascii?Q?rNVf8xshNbdqfh986bYKXqk16hFpRoG5vvRlfu0MTyEZdadsWFOcA+xRPPFH?=
 =?us-ascii?Q?eo26J9hRTXP3vxA2X2gsC4Bf9Gs+uayAqY8beWLDiExk2WHMa8Y6liO7mGUL?=
 =?us-ascii?Q?H4/bQVlCzCQPlrpQRtQCqayHldvzf4sQAkyzq5yxj5AAK2xEMiWZewxByeDj?=
 =?us-ascii?Q?+Dd791Thpbs7p51ZPF4DOaP9phZNI7NQtIkHc++UCBZC6P6e4O1dDag50B76?=
 =?us-ascii?Q?llChhy33AODb6vsMBSw+I1dthslgk0gi2piah6je1nPGnte0XKrvC+QuAwBy?=
 =?us-ascii?Q?Yauz5vEfpCSPPGyC2GK+m7NY8Y0byKChgAmddO10Thlck9aWvOdFTP/Q4LV2?=
 =?us-ascii?Q?nnFZXwnwQ0ywlm0F76GoUaqXqOU8H9zHQE3e8UpKpuE2KUWhAZX+X2Knm1oh?=
 =?us-ascii?Q?ONKEiKHC2/WOAsO2i+RgHtnVhJWVGTI//ol5fQvzKan8ebjZn17RVN3GP3bV?=
 =?us-ascii?Q?Mtek9Q/F/lBM0Ipi1c7A/gpiFS39S9RECJ1vK22esfwRZmrasgrph20HQCUJ?=
 =?us-ascii?Q?S0rp17l6t6c4FJRglWoSUejNo6zRVXw1xJzVcwkEuvevIdvXHCT+3llKU7AY?=
 =?us-ascii?Q?dc7k7FZ+/D4FVyOIRacg1vO0h/jSWx9UuoqFb6E63PYilRu2AQUD5Yng9gzx?=
 =?us-ascii?Q?RuhUZOAzjsBIKupnARUhdWNVCVhzIAwI3kPBNXK3dgDisbC85Bwkgja1HHod?=
 =?us-ascii?Q?213Dc4lAJQ57NaQZIIfWqCaoxwiJsP0P9qdkTjAsimE0PF9vxX+ApXugSJvK?=
 =?us-ascii?Q?b7ohwdsWdkmZKDJOVwaWbyAqXXqppFaGPBq1mfX5F6ThJl3r9iMufEWJOASD?=
 =?us-ascii?Q?CQMWMXPgZIay27qTbj5QKY7efwCXTg2tfUTjRoXwNYrMVMo6n8zCv8n0GwnT?=
 =?us-ascii?Q?Z7SP9kJIxEyr7SPVNqyHly7AvS3xL9f96bw8yXg9zpNT5qOI4LSlJWHLIXdB?=
 =?us-ascii?Q?WRM2Rc3S5dPCKnS+K/w7KEdU0sXBX67OEyaJicHt3sGPO6/nrPQCjWk4Oy6g?=
 =?us-ascii?Q?6ztK0lrGrrsvkWp/rt6juRWWuQUtns1w?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nCVez8wxfYy9/Egw/L4Fp3wTelCJc4H0X3Nf1Vt5XDri2HOacE3GsHnxSzhy?=
 =?us-ascii?Q?On08G/mDaEPipfLUY39Hj4mLcArDMbXNW1ghwRTbAvsEbzdb/KszjbVmyc1A?=
 =?us-ascii?Q?g4SVTQ8lZSMAuoadIH8kiQIsA3Huu7Y3IYU03DCvwHdHgv5jqaqoj40sC1z3?=
 =?us-ascii?Q?k4Go7b0acm0bNkgrK3aRgllciX5WXsGtLMZUxxj8/pvCIjnZZ6KEDXcB3Xtp?=
 =?us-ascii?Q?H9Ga6RCCGLKkFnFYCHsGNahE2T1uSEqLECoQ0zULUbUN3S7NJ78fZBN0aUFM?=
 =?us-ascii?Q?YfXfNXsXnxlxdqmqJ+VFQa5TggaImLGwZ/miB3PxS/wClwofjxpLbDMvRzDQ?=
 =?us-ascii?Q?N3OFOMFf/QGu/z5bN+SJnnfVoslPGQJzeLH5fjTZSSfsi985DFtsANc/GJtY?=
 =?us-ascii?Q?VJWuN5Pb8Nxw7+Dr5F5te11TrOy9HFespLN7beBn+2v+R7T6hyZYbihYOPb+?=
 =?us-ascii?Q?LaHePRdweV2B4UOTA8A/NGtOcIlBHt502trhwWAFXLKdUZ+LygpjteoU8ycd?=
 =?us-ascii?Q?o/mVZTsypS9d6nhM0RHXLyVSLQAZnAObykJwjMstJ5CpnqnFixn/eFvsrhOy?=
 =?us-ascii?Q?7c80NkuL5VXuufLFrOZKdITOwT/XKgVwd2IuCizgv1VRC0DeBRyGwUSHeG9S?=
 =?us-ascii?Q?KAjZPTq06C7pRKH4s0DgVpC2hTzrtY0Pdl0kwTYL+/7kBeh9uiXevK9pcmlT?=
 =?us-ascii?Q?os9uOu2GsE1D53aQ0DpcPe7v8k/ztStZnq0uTFutjOds4z+Y/yTz/GyYyLjx?=
 =?us-ascii?Q?pxgIiX9q4CJjP1tCdouKGpHYcVsGqMurj6ZXZjn8UH+DROUaIMITER1m1/fc?=
 =?us-ascii?Q?kARY924fLR2fuR53qTAFiERnXlwqmHR0fge3yK5VuKks57quPpNtoGpfOJVx?=
 =?us-ascii?Q?gcA0yt9isisVJwHHX8DbDlZn/pXboEtQhR8k/LTk3Qk+nL0T/+GZSXT25YVv?=
 =?us-ascii?Q?w9FpTyCqlWCCFPwwLeFRZnYnTnodH5TDiaKOvko4OixXKr8EA3jPz96PbRS/?=
 =?us-ascii?Q?hJhyPuROl8XC1KA5aCTp/niIplJ2+umCv9AehwKmRmnsxefWDZe7Xu9DT1bN?=
 =?us-ascii?Q?UGo+AIYMF3EJw+Dm4h53/DSU2mS8ZY7+fq2dDBl5NRbJhuvjZP+DD4nsma2o?=
 =?us-ascii?Q?RsPsD+lSPWT0/LPAb8+lhcK2CXVDLy/7+OEZU5tnRgISCCys5QcgKoBy7kWj?=
 =?us-ascii?Q?LmJ29X57/ZUKCnfzi0Yd2/PASqQSkzNlsY9nsNNNXRG5H7jYhCxN8zhnV6NG?=
 =?us-ascii?Q?EhJriFmecoMWsrdkn+Wvhs+osM8rtelte8ImzTx0RGRCq7DWCNOd5zRV3FKd?=
 =?us-ascii?Q?Rcdw1JDIaVwjeYA8dE5F50xWJahTB2NUUkPe64QnFkgM4L5yw9SCI1oMl/2W?=
 =?us-ascii?Q?Dy3P3bwk/SwBHeU3KImZZz3F6aMdDFaY44iCJbv9/yXfvO2Shlq2yjtvNGaW?=
 =?us-ascii?Q?aLF7cg9dm4D+sM6wX4mfL2zFUbAr6SSWPQXXHRV7lPuK6J2PQFQH6uPw5iGI?=
 =?us-ascii?Q?gH9aD1Lt2CvX4OHF6+y6DyGBGm4qZ5bTzahIsYHLCwuON4f1iciWMMiBW4eu?=
 =?us-ascii?Q?ek25/6HtpOMbzytBQX+dHeVWD18d6pUsHNghJ3Fx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b172c160-0023-4759-2850-08dd761dbfee
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 21:47:10.2292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PeqnLAKkxMgGmB6qXRArbUpUpal9qDIlSUxRXxR0AT8Tqvkfj5naFlLV3Gz+reA1ZSPiifg0uoDUdJzBliKPO4rfZCJr9erq1jgmalRTRy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7836
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Monday, April 7, 2025 1:19 PM
> To: Parvathi Pudi <parvathi@couthit.com>
> Cc: danishanwar@ti.com; rogerq@kernel.org; andrew+netdev@lunn.ch;
> davem@davemloft.net; Dumazet, Eric <edumazet@google.com>;
> kuba@kernel.org; pabeni@redhat.com; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; nm@ti.com; ssantosh@kernel.org; tony@atomide.com;
> richardcochran@gmail.com; glaroque@baylibre.com; schnelle@linux.ibm.com;
> m-karicheri2@ti.com; rdunlap@infradead.org; diogo.ivo@siemens.com;
> basharath@couthit.com; horms@kernel.org; Keller, Jacob E
> <jacob.e.keller@intel.com>; m-malladi@ti.com; javier.carrasco.cruz@gmail.=
com;
> afd@ti.com; s-anna@ti.com; linux-arm-kernel@lists.infradead.org;
> netdev@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-omap@vger.kernel.org; pratheesh@ti.com;
> prajith@ti.com; vigneshr@ti.com; praneeth@ti.com; srk@ti.com; rogerq@ti.c=
om;
> krishna@couthit.com; pmohan@couthit.com; mohan@couthit.com
> Subject: Re: [PATCH net-next v4 05/11] net: ti: prueth: Adds ethtool supp=
ort for
> ICSSM PRUETH Driver
>=20
> > +#define PRUETH_MODULE_VERSION "0.2"
>=20
> > +static void icssm_emac_get_drvinfo(struct net_device *ndev,
> > +				   struct ethtool_drvinfo *info)
> > +{
> > +	strscpy(info->driver, PRUETH_MODULE_DESCRIPTION, sizeof(info-
> >driver));
> > +	strscpy(info->version, PRUETH_MODULE_VERSION, sizeof(info->version));
>=20
> Driver version numbers are pointless, they never change, but the
> kernel is changing all the time. Leave version blank, and the core
> will fill in the kernel version, which is useful.
>=20
>      Andrew

It is also a long standing policy that in-tree drivers should not have vers=
ions separate from the kernel version.

Thanks,
Jake

