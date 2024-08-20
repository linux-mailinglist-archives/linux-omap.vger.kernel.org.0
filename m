Return-Path: <linux-omap+bounces-1963-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D159590E7
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2024 01:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D56E22851C2
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 23:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A371C824D;
	Tue, 20 Aug 2024 23:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSQyLNjH"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C689107A0;
	Tue, 20 Aug 2024 23:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724195367; cv=none; b=VzRZsGHAkNOMiDLqwIMRHSy+o0oE6wxi08VOjP8EKgNxXWb8O0edysY4jhu1LS8heBPmoFz8v6miyq8SrIYFw5yLvt2E46urJLyCDG3VQHCcAzppA3h/vCqSFXbYtDbx85cwZXqG97Rz9qtLli/sx38f4Q8IxfSgQMG8yRnZ7So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724195367; c=relaxed/simple;
	bh=Lbysj9KIY04ej/2hs+jHz/a8O+t1h3ua+LPYuOV2ITY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hzdi5RgNfCutowFuSuFjBMScXZZ+c/9oKBwkJwZMey3XQ4h2lWbEXe15j2IW3m8Yap2Gm49Tm397GUmx7N1od3EKv9kPp3CyruzbB+fecv1JC91zNEv0mVjp1iOw5G6pz3eN/irjEi0oTKGyi4eUm9rZSMV+vU8YfdvEGBd6sN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSQyLNjH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62708C4AF09;
	Tue, 20 Aug 2024 23:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724195366;
	bh=Lbysj9KIY04ej/2hs+jHz/a8O+t1h3ua+LPYuOV2ITY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NSQyLNjH/SWpYV7mSIKlhENVXiYwzu4ehkaC87JRAScFbzqcuMo4PGMXf1B4lC4Ao
	 cv0fE0Dp1z+t0WhDvqaojIBgeUiYqtEJOSSAhvv8RxzEHDiZEGrQ1fx8DWV+l3QOuU
	 IRfESkzSfH5UJvgizll7XWU6m4hoNRihL9+oxgwsf0rfDfa9scqgzAxJg4Je76sCCa
	 BfFq9Hao9XBHJ+f7zURXgXZjWJ3FqPfv7zZOJpnPvkxCRs3rM3/VQ6JIIrmZmIa6Xs
	 Q9LdMwtiMLo8ofzHHnffkUXfcIShMdamFdSyY1db3NcyylFeg52xMJt4qcjKYZY1U4
	 pWI8G5/PWHeXg==
Date: Wed, 21 Aug 2024 01:09:24 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
    deller@gmx.de, bonbons@linux-vserver.org, bentiss@kernel.org, 
    shc_work@mail.ru, s.hauer@pengutronix.de, kernel@pengutronix.de, 
    shawnguo@kernel.org, festevam@gmail.com, dri-devel@lists.freedesktop.org, 
    linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 25/28] HID: picoLCD: Replace check_fb in favor of struct
 fb_info.lcd_dev
In-Reply-To: <20240820093452.68270-26-tzimmermann@suse.de>
Message-ID: <nycvar.YFH.7.76.2408210109090.12664@cbobk.fhfr.pm>
References: <20240820093452.68270-1-tzimmermann@suse.de> <20240820093452.68270-26-tzimmermann@suse.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Aug 2024, Thomas Zimmermann wrote:

> Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
> now detect the lcd's fbdev device from this field.
> 
> This makes the implementation of check_fb in picolcd_lcdops obsolete.
> Remove it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Jiri Kosina <jkosina@suse.com>

-- 
Jiri Kosina
SUSE Labs


