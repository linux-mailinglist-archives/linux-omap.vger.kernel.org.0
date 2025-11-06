Return-Path: <linux-omap+bounces-4872-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F691C3D938
	for <lists+linux-omap@lfdr.de>; Thu, 06 Nov 2025 23:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 157CA188B77F
	for <lists+linux-omap@lfdr.de>; Thu,  6 Nov 2025 22:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A632630BB9A;
	Thu,  6 Nov 2025 22:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxYMr0GZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F742F5A1F;
	Thu,  6 Nov 2025 22:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762467545; cv=none; b=Mfwa+4aKhZ37qkMiAzm+O5hNXf8H5lvOyG6a2mC7v4Pv+pftRhrZLt9PEgnTE6WUDNPWD/5JEK9EMFX/DlEMUUIk1FidbrNUW7LEQclD+SVpD8k5yO/rd92IZHkZM7DpiKhyW6ihvrxTgT+JMWqizZawz/0LJ9ygA2ivgD8rnog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762467545; c=relaxed/simple;
	bh=ku2NGfimp72vXCQLrT9QSjrzqIzlPkhz0qCVVu/Kt4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e62dD5dN38DMGn7RDMGCiccUZZlSob7zsP2zrB7ybwhMI+kyCwhWvh2M1oYWCwiXQsC39FfuCD0xG7KB03VwVlJHZovu5Wg4qERcAG4AXoYJWTCmhnXpLDTKBUp83IcyMr4RznlQw2ANUhnCaVBIV7Z2ovhDQhjsZFpZzLUTYTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxYMr0GZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762467544; x=1794003544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ku2NGfimp72vXCQLrT9QSjrzqIzlPkhz0qCVVu/Kt4k=;
  b=UxYMr0GZV/8c8QF7N1KV5XXlv2NSKRH6z/uUSRFrE8QStj8BfYRjA/YR
   bXiuwT8MDQTgul5mN/mDixf9O5Z2+tKRuWzag++a459MSivdsnJLLHyN/
   nUPJuQ+dShOey6DJ2RTWfTxiLmU3qfRhDeMuTVUu57Syp7kYS+Md9sGjR
   83fJBc3dACvOP/faERMAgV8pX0ykRABj3DARggiOTtrbR9w4hMCNmek6y
   xpJ322PH9puBhRdPZbTI8c75R7s+Q6hxXWyY29FZ4FgKBJGloDralkM8c
   X4duyzMAcMXMLbqhYkxXcvKaeuWpo+wFjdmYabsaXfpP2PMfciawU75B/
   Q==;
X-CSE-ConnectionGUID: t4cHfqi5QuCAcKhPnAlsNQ==
X-CSE-MsgGUID: ggGIHikDTS27aShoSrQZHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64525277"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64525277"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 14:19:03 -0800
X-CSE-ConnectionGUID: lBzv9szdR2OCNKtzHh4Iog==
X-CSE-MsgGUID: ZiLLDryOQ86qbAA/p2vl1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="211327684"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2025 14:18:59 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vH8JX-000UOa-03;
	Thu, 06 Nov 2025 22:18:49 +0000
Date: Fri, 7 Nov 2025 06:18:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Davis <afd@ti.com>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	"Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mfd: tps65219: Implement LOCK register handling
 for TPS65214
Message-ID: <202511070607.Il9q9meO-lkp@intel.com>
References: <20251106-fix_tps65219-v2-1-a7d608c4272f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-fix_tps65219-v2-1-a7d608c4272f@bootlin.com>

Hi Kory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1c353dc8d962de652bc7ad2ba2e63f553331391c]

url:    https://github.com/intel-lab-lkp/linux/commits/Kory-Maincent-TI-com/mfd-tps65219-Implement-LOCK-register-handling-for-TPS65214/20251106-185551
base:   1c353dc8d962de652bc7ad2ba2e63f553331391c
patch link:    https://lore.kernel.org/r/20251106-fix_tps65219-v2-1-a7d608c4272f%40bootlin.com
patch subject: [PATCH v2 1/2] mfd: tps65219: Implement LOCK register handling for TPS65214
config: i386-buildonly-randconfig-003-20251107 (https://download.01.org/0day-ci/archive/20251107/202511070607.Il9q9meO-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511070607.Il9q9meO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511070607.Il9q9meO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/tps65219.c: In function 'tps65214_reg_write':
>> drivers/mfd/tps65219.c:479:26: warning: variable 'tps' set but not used [-Wunused-but-set-variable]
     479 |         struct tps65219 *tps;
         |                          ^~~


vim +/tps +479 drivers/mfd/tps65219.c

   475	
   476	static int tps65214_reg_write(void *context, unsigned int reg, unsigned int val)
   477	{
   478		struct i2c_client *i2c = context;
 > 479		struct tps65219 *tps;
   480		int ret;
   481	
   482		if (val > 0xff || reg > 0xff)
   483			return -EINVAL;
   484	
   485		tps = i2c_get_clientdata(i2c);
   486		ret = i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK,
   487						TPS65214_LOCK_ACCESS_CMD);
   488		if (ret)
   489			return ret;
   490	
   491		ret = i2c_smbus_write_byte_data(i2c, reg, val);
   492		if (ret)
   493			return ret;
   494	
   495		return i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK, 0);
   496	}
   497	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

