Return-Path: <linux-omap+bounces-1191-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3153D8A4F71
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 14:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 635BC1C20E96
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 12:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090786FE3D;
	Mon, 15 Apr 2024 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMhMOAIR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251D070CB5
	for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185258; cv=none; b=D6HqbOsl7OSSSTXDVjD7LTJSH5PJ1+ZljOH4QPub5lpZontufgGtyOs81UaSWKQ7WE9guwRJxq2fgFQz2LZ2FmVBwkjBoRHQnO9H+jCxAlQaQfptQ1JgvdCseAnZDpPVjXbPuBdq6OIIYjuZa6FE7xj5xmRVQIOnHvIs2Lqtw4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185258; c=relaxed/simple;
	bh=3t4xYvc7hHt8pbqXgosG7LpZfvaanvwAGHZrjcMgUgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdjGGXoLQcBIOZy6RzD3fBaOADAsRMR0urvfjbS/GGKG46LtYOAN5BNiSjjI8HWALr4vyvQZCkK37q+jkhQrse9ny9stjW3N2KL9PBMN8e2ExewNB6VqX0RNnej/Lphtc/ZNmlcyXGYQMfbJvYhGfQFryIpRSsRqCJlUDkSyw6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMhMOAIR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4155819f710so21238945e9.2
        for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185255; x=1713790055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3t4xYvc7hHt8pbqXgosG7LpZfvaanvwAGHZrjcMgUgM=;
        b=zMhMOAIR2xHVidy3q7bh2Eg1kxU1D5a/eh4LmM+imz0betaRFq0zd7DvVp3BC46NKp
         dusdIc69deorbnMnYI74A3rSI69fxUkyQwD90y+M13gq8mDeCC+4w970wQuaUZHBrPZd
         ChuyElUAjMf9qOm2cj98/TSvbazx/qcsJMJsFCrXvXnFCHOHqD8jx9UEXDGdFug7f/zY
         7259diEnulw9wGo0cRY39nrjhoreVc4yxe1g6WL9YoSjcE5ykGjNVRtbHYtE0sJBeZB9
         gm3IibcmR2mzEFtFmeBju9ki1ZHIMdxl7BCt/9OGshcmeEOYxozmJCOdypjDrFRR50p8
         8uCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185255; x=1713790055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t4xYvc7hHt8pbqXgosG7LpZfvaanvwAGHZrjcMgUgM=;
        b=G06wVD56JBkkd/nPff+9TGM/YDWFePHGz580nkmtgb9sJ4nYEu/i0DmeiZauXILTEW
         pvHbUCaYWGR5VeaTu5G9cd/PgmlLaMX9j4r/wQ5uN8ezr6Sgos7zGflmWl3nyhS9AnPZ
         V4ZjS57MI9CI38TrwBzP7GK+edsger9RYbdODfB4BlMi2mov6m6r5F8tH6zlJLt0qF9E
         /fSfjOThcqq2fZCy1t46jK4Ns7p+1Pjd4FcMTi2G3cLPRas1TWsfD2mo5V0W63RlsfHt
         voCPSVE6OvaWnrgAM3BmjU60w1jIPITcp8CHvB1mD+qI5LxNmn2/8ihsayfTLIjRBYLK
         tSZA==
X-Forwarded-Encrypted: i=1; AJvYcCXhj0rlctB+keGVu4/1URLCtgAj3eg5vE3PBmUgtnpQD1EDgYHpuYSXZcdLt7Nr+EjyJ2B3uZUVEqcnL+IRqRcqit/ILsLejaa4NA==
X-Gm-Message-State: AOJu0YzoSWt3UHjOFIiUlVe4IfU89SK1k6k2pTPCEzXMFrH7FkVasZbC
	WbLQK5hioq+p+/QecQ93dU31b6g3b+tqOgNDxFU87lHm7xwZuCwIFhUma7sjvSs=
X-Google-Smtp-Source: AGHT+IFkh12z6YoZcRxE26DaCtpPtJRpH8bNSc6xGkmU2C8eUzmYQG+zsWzJQF76MdI0E3ybiY+H/A==
X-Received: by 2002:a05:600c:4e8b:b0:416:3f85:d49 with SMTP id f11-20020a05600c4e8b00b004163f850d49mr7937971wmq.18.1713185255476;
        Mon, 15 Apr 2024 05:47:35 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c3b8c00b004165315d885sm19315874wms.11.2024.04.15.05.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:47:35 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:47:33 +0100
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
Subject: Re: [PATCH 02/18] backlight: ams369fg06: Constify lcd_ops
Message-ID: <20240415124733.GB222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-2-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-2-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:00PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

