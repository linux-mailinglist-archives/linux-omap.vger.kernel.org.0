Return-Path: <linux-omap+bounces-5097-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 388D8C9AB08
	for <lists+linux-omap@lfdr.de>; Tue, 02 Dec 2025 09:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 65F284E3774
	for <lists+linux-omap@lfdr.de>; Tue,  2 Dec 2025 08:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96449307AD7;
	Tue,  2 Dec 2025 08:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bFtrTfri"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1168D3064A7;
	Tue,  2 Dec 2025 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664213; cv=none; b=GTUj8yfGZ/AtMMRZttE+2RM5s2vjJEgG0j0KaRPLcizAYCCLdcUdbwRiAWeXjgdu+vFZFsP7BF4rBYfQT69EYzShsaMFq2grtPnMAJSTaojUbJDLgf54yHSG+89khMWeAS1gmTkF4FI+MljS72gUjiZuKEKBQW3xaELvuXFpm6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664213; c=relaxed/simple;
	bh=+lj+bZRlds/xy2q4zQV7RTtQvE1AbWJgmKlJsd8eRrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BN9R47dleSMYDH1HZn/5AGUrkMJQ/v3I7bW79SxXrisOiOqaBAHiq2VZZIlIm5Q72cMBscHq8sj3RYufpX9lqXxDaE/j1FIHZlmSrsmPkG3wLGpGsk0VG445k0Oy+wVdNq8Drou/AQTLmZuS7JXEuBE1moY4fF1zDGkHFIR1TY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bFtrTfri; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1458CC19421;
	Tue,  2 Dec 2025 08:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764664212;
	bh=+lj+bZRlds/xy2q4zQV7RTtQvE1AbWJgmKlJsd8eRrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFtrTfril2dSj9mrsWLqSuSJ7hI49ZPwmxV5+5H1XppxCEtU7HtmQsu+P7AGxVXcj
	 7Ia2CaItidyhqZupjfsmFqwq051XNuDrTWl5vksX60iBVgjQXnDPL1XZ1NiDd9NZJs
	 1qTA7zOMCVfQaiHSaUREbYvIaMNe2eIfDK/bVExE=
Date: Tue, 2 Dec 2025 09:30:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: ehci-omap: Fix missing usb_phy_init() error handling
Message-ID: <2025120256-wish-shrubbery-20be@gregkh>
References: <20251202080027.1124-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202080027.1124-1-vulab@iscas.ac.cn>

On Tue, Dec 02, 2025 at 04:00:27PM +0800, Haotian Zhang wrote:
> usb_phy_init() may fail if the PHY clock or regulator setup fails,
> but ehci_hcd_omap_probe() does not check its return value,
> potentially causing later operations to act on an uninitialized PHY.
> 
> Add proper error checking for usb_phy_init() calls. Add a new
> error label to properly remove the hcd.
> 
> Fixes: 4e5c9e6fa2d2 ("USB: ehci-omap: Tweak PHY initialization sequence")
> Fixes: 49f092198f4f ("USB: ehci-omap: Fix detection in HSIC mode")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

How was this found and tested?

thanks,

greg k-h

