Return-Path: <linux-omap+bounces-1190-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0278A4F6B
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 14:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF6121C21137
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 12:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43B870CCC;
	Mon, 15 Apr 2024 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="shJEToUm"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34FF6FE26
	for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185216; cv=none; b=Bct67pXi5QJ9P3pDrVegPFmj+ved/Czwja8VQ8NroXdV1d2cnSaDvK2Y4042EwPcDmGjrO10qeTMwxbE2HTTBrtF9yi2oGKqsOQS6ftPU8gv8DFfmdBkjVx2y9RSVLNwPqAPPGoCzrLLsp1jszOebWgb1MyELctrXkG0+SjRA2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185216; c=relaxed/simple;
	bh=LZr9b2jjHgXnxRQrIHWuOp1TQFMyAy7pMficXH8VXFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwOt2/hGrbqLwUalyPzeUmLHshWuRLuCNdCCwKXeeFCPo3nXfhD2+WfXhsk+IggXoNvId3NLoC6Pzf2FJrWNUJT3+EOdCo6WmKnrueYW5eyldOJhzTfYtgfwcAR+PjC4jq0uOnoIllVwH8sMbHRYtLQlbKc0hxFh48YmnhDyp68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=shJEToUm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-417f5268b12so27066965e9.1
        for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185212; x=1713790012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jbZUbhG0ov/FwjYBTgroRKws49tP3YZqZ1e9nA++yqQ=;
        b=shJEToUm56T4SyXUqRI9Lfj9MAE3WjgiLsMAstobhhQyUD9ZndUBy6azMFjMFjANfo
         CQMrODslF+6E8HEDOAqsRAOMGGgQFBDkmxQr1kg9h6HK4t/9AapwQ0T7DPiTPYbKo5y6
         oAGi2WaasaxvZRfaKkMb4hPDLG+3fOYlgXTpYFucaZpppH5PBY7PhG4qDIiffvZA47Hj
         geUIBRl+L3em8L0EEf1esoxsXNYuBTrifcEqKJAdkT/JP6UgZABmGr3u8rIC6tVEPEnt
         OGv4JdbrDhJlqUCEUB/K20slZqb++3BCzoUmsqfRoj5Iat0G58Qc5r1GjbEp/YFveXEZ
         LeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185212; x=1713790012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbZUbhG0ov/FwjYBTgroRKws49tP3YZqZ1e9nA++yqQ=;
        b=VAew4+QmAw49krQkDY7dkmty0lo9VGb4WwsuDzE8Tsvu1wleFCygXYMwb+WSn2r7zt
         MOT7bW0k3V+t2pz2MJb8QYu3qJQaHpR6IPFfwpkXqbKf3nA8ZHfkf6McisYuMoZKRHtl
         h7vY9Ln+YRsJikrk7lKi6EDuxnX8t3dXl7hw50dyj8wrL6W+cWvSuJEItrgSeI+bfeyy
         SuuZC3xDxQuJWkVtf0tJp1N3zVhMNy8Z2J3dF9GuZlUYYcOz/I7DZBn0RVtgiorYLBqj
         AkIo3Ly+AkGK/Fh5iosTOVk+FioErLTPnnm6enVbW/as8EcQ3h8OPtV2s/K0u8NbpqEk
         7SDw==
X-Forwarded-Encrypted: i=1; AJvYcCVEzypmQ9kZf1FfxZ9/eI8dy6/CcUxFNGSWY5k+qFSyVJa6irReYjtFNPyGZLBmY7+jNYOUcCQWy4zxFzuAYMRe/GynkmnWAupMRA==
X-Gm-Message-State: AOJu0Yx3SDAwa6VN2bKM9t0lT62IilHdXXyUBi0pxiGOqyyF0JjJ45wY
	yGMxdccyEy4kv0F7liBJu3lIzwKpXpFP16yYqGsOh0koUiFz/i3RCUEPdWgB+nI=
X-Google-Smtp-Source: AGHT+IGhmqnCG1TcWkxS+Zn15K31a+Oo01IPIQuW6ofPPWCyjZuMzPolU6GYhaxMv6ytY7keceZXhg==
X-Received: by 2002:a05:600c:1e21:b0:418:6cda:e95e with SMTP id ay33-20020a05600c1e2100b004186cdae95emr1418529wmb.8.1713185212321;
        Mon, 15 Apr 2024 05:46:52 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id w16-20020a05600c475000b00417e36953a0sm14818200wmo.20.2024.04.15.05.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:46:51 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:46:49 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 01/18] backlight: Constify lcd_ops
Message-ID: <20240415124649.GA222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-1-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-1-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:35:59PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' passed in lcd_device_register() is not modified by core
> backlight code, so it can be made const for code safety.  This allows
> drivers to also define the structure as const.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

