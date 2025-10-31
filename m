Return-Path: <linux-omap+bounces-4821-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EC2C2644E
	for <lists+linux-omap@lfdr.de>; Fri, 31 Oct 2025 18:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 732454F1DE3
	for <lists+linux-omap@lfdr.de>; Fri, 31 Oct 2025 17:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3C330214A;
	Fri, 31 Oct 2025 17:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lma9lMk6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE462FD684;
	Fri, 31 Oct 2025 17:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761930156; cv=none; b=t9f6yoAQfatOFTT1X5TiUDSfW8RI+n1bHBpDZddnRmMMCv6psvjJKyJOKRgmaam9ojGdx6ls6XpEmbM+ARa1/AwmuQk+xP54R/tCrhiTN+TtiEac2V+Dlx7S88p82nb6CJDHZGv5qH5r7JeBR0gK7Vn7U8XX4qk2FGrPBHidq24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761930156; c=relaxed/simple;
	bh=xBrRg5gnKGkW3B8XP6rpJw1tbT54300fN3/BrYXoe+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9uP0Tb9ydAUhrpd5VkvJFX0pmOK8wGKd7OnyzZsAURK/7NYyhN5urA4r+uKP0dBg7JMeI4mnm7B9pahuMcZp1XH7AfIpUJzdspOlxE1baemvDEHIQg5uE7R37bYutggobQMUoQ7OStqcMZSH3yNaVMsTc+7xQ9g7RxzJEzgq0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lma9lMk6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761930155; x=1793466155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xBrRg5gnKGkW3B8XP6rpJw1tbT54300fN3/BrYXoe+o=;
  b=Lma9lMk6fwafyitW9KDq8JNZ+QtBtpMG1Mudzi0OedI1BwkSulAtjqws
   iInP4luoD+J2Z66Ix8zJibqd1kC5GDripLfQUMaNVH/7d9YFXdPjkXqca
   Auinpcf0ndLE1kxbJ7S705xPQGkIeryJ3UdpY0u1UbrvhUzCAX7W969mh
   /w25EAWkKhJHHoPx3TQ69pMeksXtsZVmBvgvUzoktkHt54g3iPjEBTrkA
   /Ge5FtyEsFHtdZ9bNos7PLWusXyXubxnsSGxhDxxGWO+vKMGIKC9HcAAP
   MawvomwlTNtSKb/p4RsK7uxkm+VEO54i+n5Os19gXl9rqT7fbo4SSYrwN
   A==;
X-CSE-ConnectionGUID: LjTz6QYpQa+UzAfi1SSdUQ==
X-CSE-MsgGUID: i0RO0dLlTh2ODri0JAsmyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64022383"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64022383"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 10:02:35 -0700
X-CSE-ConnectionGUID: x68roOhWTn6lqkp9QuvNGA==
X-CSE-MsgGUID: ZjElhhxgQQ6EulK2irEIZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="190629319"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 31 Oct 2025 10:02:32 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEsWC-000NUK-34;
	Fri, 31 Oct 2025 17:02:28 +0000
Date: Sat, 1 Nov 2025 01:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: akemnade@kernel.org, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Input: twl4030 - add TWL603x power button
Message-ID: <202511010024.4O4b58oK-lkp@intel.com>
References: <20251030-twl6030-button-v2-2-09653d05a2b1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-twl6030-button-v2-2-09653d05a2b1@kernel.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/akemnade-kernel-org/dt-bindings-mfd-twl-enable-power-button-also-for-twl603x/20251031-031300
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251030-twl6030-button-v2-2-09653d05a2b1%40kernel.org
patch subject: [PATCH v2 2/3] Input: twl4030 - add TWL603x power button
config: x86_64-randconfig-123-20251031 (https://download.01.org/0day-ci/archive/20251101/202511010024.4O4b58oK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010024.4O4b58oK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010024.4O4b58oK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/misc/twl4030-pwrbutton.c:44:31: sparse: sparse: symbol 'twl4030_chipdata' was not declared. Should it be static?
>> drivers/input/misc/twl4030-pwrbutton.c:49:31: sparse: sparse: symbol 'twl6030_chipdata' was not declared. Should it be static?

vim +/twl4030_chipdata +44 drivers/input/misc/twl4030-pwrbutton.c

    43	
  > 44	struct twl_pwrbutton_chipdata twl4030_chipdata = {
    45		STS_HW_CONDITIONS_4030,
    46		false,
    47	};
    48	
  > 49	struct twl_pwrbutton_chipdata twl6030_chipdata = {
    50		STS_HW_CONDITIONS_6030,
    51		true,
    52	};
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

