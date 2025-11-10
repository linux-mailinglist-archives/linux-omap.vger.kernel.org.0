Return-Path: <linux-omap+bounces-4887-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9128C4704A
	for <lists+linux-omap@lfdr.de>; Mon, 10 Nov 2025 14:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EDCC423FB7
	for <lists+linux-omap@lfdr.de>; Mon, 10 Nov 2025 13:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F61D30F55C;
	Mon, 10 Nov 2025 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcM3pBk1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F9F228CBC;
	Mon, 10 Nov 2025 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762782148; cv=none; b=NoToLihSk3AUihuY/kXCH9e/M2L2WuDEnmVYLDWo2APqsZDbZ91hx6sREgAq/i8lvvcVEzSgi4f1Q2kazBr8KPdlwu5hjJNSJ5UyIterTjiYf0LfH4gj//RgNAcCBxUAA6Bg10AA995JNdvfrWLtqT91+9aQeT76voxIjGQrP8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762782148; c=relaxed/simple;
	bh=odW9RE5kXkX2DoPQTnJV7+yOA9qzBKlmq7olgQ28j3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJGdALyxp1rlw20bS7x0ApS/fz4uhS7vGwZJFBtPeyDZgTQF+wP1NK6UE5c9EFhQfPqEQgUUFwU+mvI3qhMGRc5e1Ytae9qhHdkFJPA0v/nnH6Shdw6SR+gVI+qxhfP6wZkzpomicfQl7HEDEVhH8uOAqdaqTlyj2JAWxjOVNEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcM3pBk1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AC6C19422;
	Mon, 10 Nov 2025 13:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762782148;
	bh=odW9RE5kXkX2DoPQTnJV7+yOA9qzBKlmq7olgQ28j3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BcM3pBk15O8CeNHJ6ZFU3yCzeMV4Y+gf/ucl4hMOp9TkHKM4w83754QMcY+eHCplJ
	 VVvkxwiMOhYVejdAAQ9ZV0OPwuRx+XLt330hwDHRO4OHadL3UaBkhzHbMyi4EGaAgA
	 u5Ole6i5YV13ByA1G8X61zv+qbe4FLEcet5D57A8PbObccoz9wMQKlAZnxxQRUaP69
	 HlOhICvag0gpNdQs903tkSLBxBZOP8dCzqepwtV8tZ08Z6zy0iTTNtRqxegEK5SZaJ
	 V1oWm0OMSRwIrHwH3HINjqk3Xv4PACI/el1NKNphPbwoV51TtN0A6IF4pyeatJz4Ww
	 DOTd87ugiq7qg==
Date: Mon, 10 Nov 2025 13:42:21 +0000
From: Lee Jones <lee@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mfd: tps65219: Implement LOCK register handling
 for TPS65214
Message-ID: <20251110134221.GD1949330@google.com>
References: <20251106-fix_tps65219-v2-1-a7d608c4272f@bootlin.com>
 <202511070607.Il9q9meO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202511070607.Il9q9meO-lkp@intel.com>

On Fri, 07 Nov 2025, kernel test robot wrote:

> Hi Kory,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 1c353dc8d962de652bc7ad2ba2e63f553331391c]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kory-Maincent-TI-com/mfd-tps65219-Implement-LOCK-register-handling-for-TPS65214/20251106-185551
> base:   1c353dc8d962de652bc7ad2ba2e63f553331391c
> patch link:    https://lore.kernel.org/r/20251106-fix_tps65219-v2-1-a7d608c4272f%40bootlin.com
> patch subject: [PATCH v2 1/2] mfd: tps65219: Implement LOCK register handling for TPS65214
> config: i386-buildonly-randconfig-003-20251107 (https://download.01.org/0day-ci/archive/20251107/202511070607.Il9q9meO-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511070607.Il9q9meO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511070607.Il9q9meO-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/mfd/tps65219.c: In function 'tps65214_reg_write':
> >> drivers/mfd/tps65219.c:479:26: warning: variable 'tps' set but not used [-Wunused-but-set-variable]
>      479 |         struct tps65219 *tps;
>          |                          ^~~
> 
> 
> vim +/tps +479 drivers/mfd/tps65219.c
> 
>    475	
>    476	static int tps65214_reg_write(void *context, unsigned int reg, unsigned int val)
>    477	{
>    478		struct i2c_client *i2c = context;
>  > 479		struct tps65219 *tps;

Please fix.

-- 
Lee Jones [李琼斯]

