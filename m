Return-Path: <linux-omap+bounces-5290-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE0ECE8F75
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 09:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC7893011A51
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 08:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663842FBE12;
	Tue, 30 Dec 2025 08:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUJx4hTS"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECC11519B4;
	Tue, 30 Dec 2025 08:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767081804; cv=none; b=Lv8yAjBA5N/xxQHF1cGeBCScyHHVcKXABN5VAmfA4I6TxQXPnNvby7OkptuGhW+O3y9r+Xqzha9Xiqub+NDsFTpY+oVKn/Ln1wqNWhWVc/TfQ1z0ybZ6sksfEX3G59vaOVnvJILxeMycKsxbhoyY+cfDxstxL9Wb/fhyH8ZLKFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767081804; c=relaxed/simple;
	bh=MnoVGy5Tz+lUwmL6CZGk3fOQGjOOkJNy2JVQWRXNHVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMPnadffTSZsVvknVgdnJ7DkOXd4uUBPXT+Gqkc6NhDmkX5kucVrDR6IiprFWdjzM7oHlQrPVihYWFIxrRXKFAbp2OLPIU6hcuF/WXGpCN6cD7Pz8ohe4Rbv1BSVdfe514tXJV31uQsijMPVmbHqrlN2Or0UXdPtUOAeO1r7s7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUJx4hTS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF5FC4CEFB;
	Tue, 30 Dec 2025 08:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767081802;
	bh=MnoVGy5Tz+lUwmL6CZGk3fOQGjOOkJNy2JVQWRXNHVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUJx4hTSWFRRsSlOL8Z7Vo8XO8XNCdeYUGXsGdHi+2wpydMT1xsFsGlvvep6ut5Ik
	 4fMrYviaETqevMxQUspTBn73pM9HVnVw8u3I4D2y0AmVrW0xpIUwGbV6QLrOHoUGEQ
	 o2xaey82bIk502tsW5kUeNsUv1nvjXjqvjkJlqgMhxYXAkekRKs17tiQh0M0pZMW0Y
	 jacHW2mqCKjB75KCkrAaXTeQMj+rXm2vKezngJYM4NhbxPvFrniSEpupfcSuhrdR4+
	 nvc2VeV9grZXUTmcI/u/7sXYIXXLkhdoGQdNxqvJgWelTMxzjy1+ly7S6alA+V1ZBJ
	 GgIgORWttG/mA==
Date: Tue, 30 Dec 2025 09:03:17 +0100
From: Helge Deller <deller@kernel.org>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/4] staging: fbtft: Make FB_DEVICE dependency optional
Message-ID: <aVOHRVoFvTKtwl_I@carbonx1>
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-3-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230052827.4676-3-chintanlike@gmail.com>

* Chintan Patel <chintanlike@gmail.com>:
> fbtft provides sysfs interfaces for debugging and gamma configuration,
> but these are not required for the core driver.
> 
> Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
> sysfs operations are skipped while the code remains buildable and
> type-checked.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>

Reviewed-by: Helge Deller <deller@gmx.de>


