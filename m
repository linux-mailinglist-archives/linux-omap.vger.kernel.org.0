Return-Path: <linux-omap+bounces-1877-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE0394BE50
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2024 15:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E04E828D3A9
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2024 13:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA09118DF69;
	Thu,  8 Aug 2024 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXiLTl6L"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BF018A6DD;
	Thu,  8 Aug 2024 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723122961; cv=none; b=OJbDC0eKV913dk1G6vJrGBgp1AFWv7IshJb0FTO2FFTIUUndVmO2U8Zma9d3qFjiLCUVyc93FRl05nPIAxd8bV24lC3JZjBqmvSN2J+BEY9K1KaeBonpuGYX3oJWeO81yWR0jkP5RlM9HC/MGqa9PhT8oJP3QTqHXY9k+4oOy08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723122961; c=relaxed/simple;
	bh=LDwvaXSQU6mgwf6BXtOXY9FsaYa+mYPA6eepzvwf6lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sF4kVx+ManBMOWRGNk/wkMpnIKhDqoDENjUIOr/yXEBoGwFg1Cy7QCwYLlDzh4tDfXgz5ZO/ZF0zAQIXcC62Aqqrsn5Ueu/V6oF1HkwY/+hs6HUX/YPRst7U1SvZul9eMYyetuzQrVXNnV5NQfokNGMm6W3VVNtC86ok3pvSnWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXiLTl6L; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723122961; x=1754658961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LDwvaXSQU6mgwf6BXtOXY9FsaYa+mYPA6eepzvwf6lk=;
  b=lXiLTl6L4h3z3pdPdr8j/1DrhubkO6jx0VVdBhAUNAKHBRcHZlJyv1xQ
   CveeYsDAww0Oo42mU1bHlu/MOZ1tAhyymikhYvb01lM//98sDAYh7ic1i
   74D5H4x5wyDH6GST1BLqRExY3gwmdTr9JLw6egMdZOk2jsKVo41TZKaGT
   TzRmXNLHoNqPzzf4IZ6d9KxmfVtnwpGBlrMIt+XckS+NQRoSrlPbpdUn7
   LWSwucIAn1Cy+bH6o9tYOpsfUrJJR4mp23pndoLi/yb019BYRKb9JAcJ3
   smO0bS7Ghh8HPpufcgsI4fEtwjA6b7sS7/bsVlsmtv/b451AjNEWcBjh3
   A==;
X-CSE-ConnectionGUID: 0RxPXsw6SDyxDcv2Eoicww==
X-CSE-MsgGUID: aztUXvBASueXBCgADK47Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21388393"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="21388393"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 06:15:59 -0700
X-CSE-ConnectionGUID: YW7BaXndT9SqanKjBLaFsA==
X-CSE-MsgGUID: PR3hQc8tTxqLm6ocscYWzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="57924489"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO intel.com) ([10.245.245.81])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 06:15:52 -0700
Date: Thu, 8 Aug 2024 14:15:46 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: omapfb: Use sysfs_emit_at() to simplify code
Message-ID: <ZrTFAk5DCmYAKR8F@ashyti-mobl2.lan>
References: <fa1c03aded0c36585d29991d85d083853c3ca871.1723119220.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa1c03aded0c36585d29991d85d083853c3ca871.1723119220.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On Thu, Aug 08, 2024 at 02:14:22PM +0200, Christophe JAILLET wrote:
> This file already uses sysfs_emit(). So be consistent and also use
> sysfs_emit_at().
> 
> Moreover, size is always < PAGE_SIZE because scnprintf() (and now
> sysfs_emit_at()) returns the number of characters written not including the
> trailing '\0'. So some tests can be removed.
> 
> This slightly simplifies the code and makes it more readable.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

