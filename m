Return-Path: <linux-omap+bounces-2089-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9781F96A157
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 16:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E1F51F244F9
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 14:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A6916C453;
	Tue,  3 Sep 2024 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RqJYcmUT"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800A143748
	for <linux-omap@vger.kernel.org>; Tue,  3 Sep 2024 14:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375363; cv=none; b=nRmND67Ls7iRiHiJHE27v/2c07ow7Nex4aRgzPccpCZyVVnsj2iwIol1q3XCh2UKygtljxvOVpvQPa8DtFL+HU7UkH4FYDQJz5U3N60tDoUSm0JkC4MxFj8rq2AkW3vYiYplnfAHuikklbXtDhq+wMMZ5xkZ3R91TVMV6NCgkrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375363; c=relaxed/simple;
	bh=mq4PoI0gorkAyyaCZit32i3NT28bgDnJGv+7A3joxoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYVD+asPA6LcR/vt1ZYj07xcLgr4xHpOawhPB+PlgEjaNCbBC0LGFfNKCpbDjUEw+CYoujLkQRmYuca4ra715sXs/MXoOYDf73CL+GSU3VbaRqkPszfOAqzvaGE4w4a+VwCHa6Xu88nOZ7Pade2UFMExexklontqFV88MaeStEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RqJYcmUT; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c210e23573so5574754a12.0
        for <linux-omap@vger.kernel.org>; Tue, 03 Sep 2024 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725375360; x=1725980160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mq4PoI0gorkAyyaCZit32i3NT28bgDnJGv+7A3joxoc=;
        b=RqJYcmUTKFBDuLBbgyXS/8YoQdi74ETHl9WQbNjmA/L3F9SBGB7F7FUZqz1kygbjD1
         tkrCHh/Jn3qvlFcxbdN5VeXc4D3hSUZF8pp7giDFmbnXTShODQ9YL9wuVt7uBMMh1hAH
         tGKNgqtFTmBpLXVG7ILAWVQxJFyqc+zmx/D2ABnGnO/FKg19oA6Ace8u/pSrZV0M+P9A
         GW9+12o8oruwNuiaz042wvBMKzWBx063N2G1JwPE7+MaasGYOsyjl2OR3anTC2drHuNI
         Ybtd92QzWIV/rdIaJXO8KBBwexNUIm57ayrXFMmCbaECQquuy5Ps39T/suM2kBFUuf5L
         FNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725375360; x=1725980160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq4PoI0gorkAyyaCZit32i3NT28bgDnJGv+7A3joxoc=;
        b=FRbWfj3NIL5CjQxwvV4fDirPI4RpP2hoVSfAWEcvaZoez2vf2oeeF/QJ8Wep0KLFXO
         zAtqpFlWdgStTMs3sWJL05sddzUk6EltigTU/0GgXXDh3b1ozruwY7DG614OkBENiPsz
         oiYtzsSMzbSBIg/XMUh+s1G1z/5VjP4NsIj8w5OgqqX3jyMd6TmiorVkLJwQv8I9H9M5
         z7y8yaa5S38JLq8IXTL66RoIj45iX0EK0RjRyvmOH42bTPow4UmY97BZymI0i6l2FceM
         1GI5TXARHs18W4DqXx37F43dXzJFmzumHi85AFXiDRndhBEqRFMcbG6NemQuCebkQpXu
         hqXA==
X-Forwarded-Encrypted: i=1; AJvYcCWqAFcPvFj8AtzBMSo4XCkhOXPHDVo0Ul1XQIrWftBdMB6lHvuzDujMk0RkzQ0lh4xXiNNQVdn0j6yn@vger.kernel.org
X-Gm-Message-State: AOJu0YyljI6BeGq5TyUWYqdX43ymyDh95gA2qKTaGwhUmpjR+yf+Uk1V
	kPwpEysmARe0pos8hHeZlTyeFYJStYKDjVKT1dwyJSSlhIyRP/GlHSleaz3gWWo=
X-Google-Smtp-Source: AGHT+IFmCIy4WjsM9TxpFUwCZ5NOUizVwi6W7Jj6qImaS1/dW13DdSWn/EnFrWRnxL1i31++KvAcsw==
X-Received: by 2002:a17:907:e91:b0:a86:8ac7:2b5e with SMTP id a640c23a62f3a-a8a1d58a5d5mr322181966b.65.1725375359706;
        Tue, 03 Sep 2024 07:55:59 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891b9e7dsm693567466b.104.2024.09.03.07.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:55:59 -0700 (PDT)
Date: Tue, 3 Sep 2024 15:55:57 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	bonbons@linux-vserver.org, jikos@kernel.org, bentiss@kernel.org,
	shc_work@mail.ru, s.hauer@pengutronix.de, kernel@pengutronix.de,
	shawnguo@kernel.org, festevam@gmail.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 26/28] backlight: lcd: Replace check_fb with
 controls_device
Message-ID: <20240903145557.GD12939@aspen.lan>
References: <20240820093452.68270-1-tzimmermann@suse.de>
 <20240820093452.68270-27-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820093452.68270-27-tzimmermann@suse.de>

On Tue, Aug 20, 2024 at 11:23:04AM +0200, Thomas Zimmermann wrote:
> Rename check_fb in struct lcd_ops with controls_device. The callback
> is not independent from fbdev's struct fb_info and tests is an lcd
> device controls a hardware display device. The new naming and semantics
> follow similar funcionality for backlight devices.

Nitpicking but...

s/funcionality/functionality/


Daniel.

