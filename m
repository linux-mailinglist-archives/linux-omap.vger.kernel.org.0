Return-Path: <linux-omap+bounces-2090-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8846296A16B
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 16:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB73B1C23A42
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 14:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8054B1547F3;
	Tue,  3 Sep 2024 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lIyRFw1l"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1CE13D625
	for <linux-omap@vger.kernel.org>; Tue,  3 Sep 2024 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375496; cv=none; b=LJ7KEh9nqCtY5DfdGbbPOVNoMgPJuX5JNPvP4i6YKP2M+YECWFvHZ7liwj4X8TDR3tZ0jMAsTjXxgSHPTl2ftBnOBm10UOl4F1mrBnJL5LEN2LeFDcCcjHv4gMYhhbxoWvLlL2RvVrTeeqnRHpwUOQlLUfUcWyJPtiMrfQwfUEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375496; c=relaxed/simple;
	bh=bSPA4XGA/HMWn0mqAHl9enAU4Xta3+rBwl0NslhmQ4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqeWsENFGnwsMdbxCGWCoqsQF6e49oG5PGNQt+1OBZ4+yQyVx/tHwjr2QtlAMyxLcHOU3UPjPl36+r60W1aTTCHvOjxnJL0bd6zM4UgN5bvEwOpcpx6TkJYaDFTaQ/2K8jChgjtO6cGxJpvUH1y3GURsMDa8T5o7dTVOB+B3gpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lIyRFw1l; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c0ba8c7c17so2387386a12.3
        for <linux-omap@vger.kernel.org>; Tue, 03 Sep 2024 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725375492; x=1725980292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bSPA4XGA/HMWn0mqAHl9enAU4Xta3+rBwl0NslhmQ4o=;
        b=lIyRFw1lLt1N4KBYLJe4r4S45HgeBfbcNLAEnh2gs0MOk+2TQuPfRXERT3FH7Kprqn
         kXi5jJwKLU1Ze3viAkY6kig3nODZfR8ErkYVm3jr3kYY9vO3xYC6jIOm2Conye6hEXQ1
         5HzEn6/OpwfI0BhDPklgGJd3RSB/Kpgzs0Q2LdcBKth1ZY4wTExZjIow8SawSf1NSTUG
         Qo4UBCrzicIfZAh5Ves5Ly5Y3b7iY7TMad4N7KowngST5vhQkrRrLMzSkR5xuhhxyXVo
         IauuuUfuuq8AarSjj6/7Ljii1r2DwfRLitBogN3Snho1JACUANYX1f8Qsf5tpU9zo3Yd
         I+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725375492; x=1725980292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSPA4XGA/HMWn0mqAHl9enAU4Xta3+rBwl0NslhmQ4o=;
        b=R7Ba75fC5g3a80O/KnBUVBNOuVljOCuLPcf1jrpD3a6Zd+2Q5gv5Zk+wRQ09vQZ3lD
         W5+HNVqrvjIIYqYv3NOSBB8a+2zYrtlaZfKAhTlHDmLn4n0fg6KpjZltTaIgyRVA3kJM
         ullS/APGryXQ8h1tk2V7ow6u5lVeDWDoX+MGqqbVT8OYBq3X1gTxqaVoMvehF7t3y0oj
         0QH66Y0eectxhgsirpmaldjXgly+myGCo4RyMaWwop/47BBAOKqP1PGOKRo3uJ2T5o0E
         gqeg2HhqcMXijO7pjp/vyD12TkHBTLRfkXJLNhLIe8pywmqnK8PNrGW5IWyEBrtiqMtH
         K5WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWLbsheHuMTXt7jh5uiM0BRS7UU/s320vURxVWCsHYIxetU6DYAH0/pPYw1KNUHJ/2IhyzOuRKAUQz@vger.kernel.org
X-Gm-Message-State: AOJu0YzcZA2q/ClEO3WeV2I4T1oDVZcpd29QidV9XVjIoR7lBsXIvb+2
	ivkUTNVLUUvzSL11Jk8IfopHw1wLCP0Or2CWHfyRM8weDm7qys8kmqljjrk7DZ4=
X-Google-Smtp-Source: AGHT+IHDyxRfrNtN1k34SW/ZwHHE7I+ng+iaoDNfy1kS+LWoqGSB0gPz+2XnTlBVg8+KYaoyIzNkPA==
X-Received: by 2002:a05:6402:40ca:b0:5be:9bc5:f6b4 with SMTP id 4fb4d7f45d1cf-5c21ed315fbmr18026702a12.8.1725375491662;
        Tue, 03 Sep 2024 07:58:11 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24ff04551sm3631120a12.35.2024.09.03.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:58:11 -0700 (PDT)
Date: Tue, 3 Sep 2024 15:58:09 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	bonbons@linux-vserver.org, jikos@kernel.org, bentiss@kernel.org,
	shc_work@mail.ru, s.hauer@pengutronix.de, kernel@pengutronix.de,
	shawnguo@kernel.org, festevam@gmail.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 00/28] backlight: lcd: Remove fbdev dependencies
Message-ID: <20240903145809.GE12939@aspen.lan>
References: <20240820093452.68270-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>

On Tue, Aug 20, 2024 at 11:22:38AM +0200, Thomas Zimmermann wrote:
> This series removes most dependencies on fbdev from the lcd subsystem
> and its drivers.
>
> Patches 1 to 3 rework the fbdev notifier, the fbdev's fb_info can
> now refer to a dedicated lcd device, and lcd defines constants for
> power states. These changes resemble similar changes to the backlight
> code.
>
> Patches 4 to 19 update lcd drivers to the new interfaces and perform
> minor cleanups during the process. Patches 20 to 24 update fbdev
> drivers and patch 25 updates the picolcd driver from the hid subsystem.
>
> Patches 25 to 28 finally clean up various lcd interfaces and files.
>
> This patchset is part of a larger effort to implement the lcd code
> without depending on fbdev. Similar patches have been sent out for
> the backlight subsystem, such as in [1] and [2].
>
> Hopefully this series can be merged at once through the lcd tree.
>
> [1] https://patchwork.freedesktop.org/series/129782/
> [2] https://patchwork.freedesktop.org/series/134718/

I shared a could of nitpicks. You can do what you like with them since
none are major enough to stop me also sharing a:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

