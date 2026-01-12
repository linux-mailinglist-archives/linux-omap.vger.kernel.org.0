Return-Path: <linux-omap+bounces-5421-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC35D10D45
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 08:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE1783009856
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 07:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D2A32AAD5;
	Mon, 12 Jan 2026 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DcJRX6HN"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456DD3090CC;
	Mon, 12 Jan 2026 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768202280; cv=none; b=FdCdP06FagvPvci2vMMpqgsd+FKyQU+tt1oHFJ+O5Gr9Bj5xN7yCxq7LzOg43b9LbtVQguG6RO5EXajzfYBjXFujsAq5vLLgPxhQa5+sMI9n8eipSDgjcsBZwo7abXnMmBx4nvLt+ImKUi2QX4OJPgCIQm3Ig41Bmc1v/uEXAO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768202280; c=relaxed/simple;
	bh=crNwlZZI8994OGzvuLG1ICgkwtzVJ/uGO7UIX+u8Vxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgdPkVtVpGrhSqclepg5Yziu0uf6LbIofdTNaybkj9xgGz5QjAdtnHGSd1p167NRIIW4eqd095JCD2hYly4I98bB4OaOyJIaXSXl7D/eDcybeHElCSmiquhGoBsICbshpVP5W0PnOnnXvj6x46fnDez1TBIhSD4olK2XGthsM/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DcJRX6HN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5357EC19422;
	Mon, 12 Jan 2026 07:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768202279;
	bh=crNwlZZI8994OGzvuLG1ICgkwtzVJ/uGO7UIX+u8Vxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DcJRX6HN5u5zK+fH4YQjOVtaPwoXTN0dcq+pA0fGEVv5n6e2tE7DTWZTAAj82gtH5
	 s5dBWb/gH0siypl7eooNTgeD8T0Hxvbuy+JoJLvsSe87EVbDl5d5/HaSwje0CJ10yj
	 8nDROgJw+JrQBmz6/Dpjg+Wj10fiBluIqqBaWVJY=
Date: Mon, 12 Jan 2026 08:17:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of
 info->dev
Message-ID: <2026011205-ideally-swoop-b04e@gregkh>
References: <20260112010740.186248-1-chintanlike@gmail.com>
 <CAHp75VeF+Sj=dxA4RZAvVddGSG3brUsy8kz7mvtst2YpqNm99w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeF+Sj=dxA4RZAvVddGSG3brUsy8kz7mvtst2YpqNm99w@mail.gmail.com>

On Mon, Jan 12, 2026 at 09:07:42AM +0200, Andy Shevchenko wrote:
> On Mon, Jan 12, 2026 at 3:07 AM Chintan Patel <chintanlike@gmail.com> wrote:
> > -       dev_dbg(info->dev, "%s(blank=%d)\n",
> > +       dev_dbg(dev, "%s(blank=%d)\n",
> >                 __func__, blank);
> 
> Since you are changing it anyway, make it one line.

Wait, why would dev_dbg() ever had __func__ added to it?  That's
automatically included in the output if the user wants it, please do not
duplicate it again.

thanks,

greg k-h

