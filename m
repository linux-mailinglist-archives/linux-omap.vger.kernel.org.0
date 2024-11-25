Return-Path: <linux-omap+bounces-2727-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B22D9D7B01
	for <lists+linux-omap@lfdr.de>; Mon, 25 Nov 2024 06:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD63AB21913
	for <lists+linux-omap@lfdr.de>; Mon, 25 Nov 2024 05:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BFD1531DC;
	Mon, 25 Nov 2024 05:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R+zB8iDk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C96F2E62B
	for <linux-omap@vger.kernel.org>; Mon, 25 Nov 2024 05:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732511587; cv=none; b=oKy11iq68yzpK8+6wuBdpVDD0Zv9hDLHRKaiVFvv4oC13fzRP9Ih3+iO9TM5kWyAywu/as+xXt8s6oJtxIbIiBS9eXgetaIN/Q3zDIz6laV3kXWV2CLX/QL2bCxgzBbYuDDHzXDeaKBRKSlukmIEIwmF88y2rZLU5CfWA25U1Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732511587; c=relaxed/simple;
	bh=Uxp3iPzfUnlFAtZhMOzTk6Quj5tPd+jppMxgxAL2OVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qksE0imGGc/ZaNMXl7KMK4qjFdE2cS3ez2UPOHesIt1U5X80QEx7NoxykK/ekjgRnpvuE3RR9+Q5N1VROfuA1oSdkQbNP39LlreO7qy3cSWn5z0F6PZD5wxEeQz5hanQ3tOXkwmNOCvmhXtdlOCapOlhTulh//LKhxfGMWe8o8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R+zB8iDk; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21290973bcbso38684785ad.3
        for <linux-omap@vger.kernel.org>; Sun, 24 Nov 2024 21:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732511585; x=1733116385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AL0bPZvRR1BK5PQ1+xak6vqZ/ECTRZ5b4f4dhCxRKPI=;
        b=R+zB8iDk7BdqgDfwjF/vkM+4Nad2kgphcvCfHB9AVz+cxiXuaUGpQR68Is3zugtwJs
         7dlnfiLtp5WQEZjWP9Lhs62tYLtfaVyn7lIffGdsE0ND1ZUNZI1yLElCEblX/uBz1BOs
         27vDYgEsDiFHBotdBxAWreDlvmdqdHlVfrBLkFtnwh82DkANAawZQ1WB3LNKgrvN6+jV
         l26naEW9KHY93XTd3I6cOVwbM65RYc01pTDNHxjM5A1eRvWR3TXqPIsfmEuoflqKPiX+
         QNnadFKUPinD1wcnc9Uj1p0wUr/lw6AHBdKQ5WBTDrSILIcCzCRFVM7bqUL9TwDW6/XG
         uCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732511585; x=1733116385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AL0bPZvRR1BK5PQ1+xak6vqZ/ECTRZ5b4f4dhCxRKPI=;
        b=nXKFFebWgdRkodAtOYzqJ9+JYF2dqKOew+LX4SndeDsfGyQrOxBLX2DN+I2t8cM1w5
         hS2V5nQryjikvY8RGRL3Nj+Zhxz8XTrWYIBp6oP9B/4uuXpcaoqhIMoKxaj9kdxhUcRD
         jDNByygDpPYTB+9fxX0RkBk07wxXXhxmpio5iqoT5hVYxE9h+hidqzc4Qvd2UzLNo4yo
         D3uTQxiyIhd4xy0h45HSTvq3zETWD/ZC5nrPI0ML+qtZZoKzwLDpFaJGgGuRPcgIU3zA
         NqpP09YGuQb1jKMU6wGt/82s2O8WZ7WUXlQCW7wUb+7zbCYINe9NknGqAijhpQz0aBwg
         x/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXRExxtuhDB/OEBnx0pA5/Ca0obuEWKkrqGiDfXqXDQfV22zJWkI7QbLq4XfssSeyofkMpJmJ22Z5Hb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpm46bOD95giVDONn6dPKBKhv5T+Q5NY/Q1tIgpUlKCX3WUX37
	wq+5oJbyHCXpWBxlt2ESz3AcAsSQ+4Zz4y1nuh7uGsn0F+hxC+rGsda7JAV0CZ0=
X-Gm-Gg: ASbGncveHfPQEr25h/ATmWAK+SE9XdsTeg4n9+hyg+bIcU18T6Z4LXsZya1/Q0n06LT
	kcysquJGDWq8kHvsLX9tGqGigjrMF41FL8Onmi2WYpdw1DKCUjONW8cDohjgBPVqCivKLfmmAbA
	YOQdhTyVObUmYeqU3Z35OrM8Aa/bXovPQIwubSxCqXZITTumn8GL2lvGCFd+9L5GFX3Siwh6b3z
	qvSmWKZgJZX1YBCZLt9cmsgjN7zcTKeLVxHVx2zhTa1XUXjbalh
X-Google-Smtp-Source: AGHT+IGb7tmx1BneKh/B9vmKsU5AzzHIggDnEW9pXM5m409dP4HngsAxqYc/QOBvt2L7HfqexG1ylA==
X-Received: by 2002:a17:902:f652:b0:212:655c:caf with SMTP id d9443c01a7336-2129f6122fcmr153868475ad.55.1732511585476;
        Sun, 24 Nov 2024 21:13:05 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba6782sm55270585ad.102.2024.11.24.21.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 21:13:04 -0800 (PST)
Date: Mon, 25 Nov 2024 10:43:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Kevin Hilman <khilman@kernel.org>, rafael@kernel.org,
	zhipeng.wang_1@nxp.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] cpufreq: fix using cpufreq-dt as module
Message-ID: <20241125051302.6tmaog2ksfpk5m6u@vireshk-i7>
References: <20241103210251.762050-1-andreas@kemnade.info>
 <7httcmonip.fsf@baylibre.com>
 <20241104201424.2a42efdd@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104201424.2a42efdd@akair>

On 04-11-24, 20:14, Andreas Kemnade wrote:
> no clear idea how. What aliases should I add? The cpufreq-dt-platdev is
> not a real driver, so I could not create mod_devicetable aliases to
> match a given device. It constructs a device under certain conditions
> depending on the board compatible, so no simple list of compatibles, it
> contains allow and blocklists.
> 
> cpufreq-dt then binds to that device and that one can be built as a
> module (which then made cpufreq-dt-platdev also a module, causing the
> trouble). I do not see any benefit from having cpufreq-dt-platdev as a
> module. ti-cpufreq has a similar role and is also just builtin.
> It does itself no real work but provides a device cpufreq-dt then binds
> to.
> 
> Handling module removal would probably need to be added and tested. I
> feel not comfortable having such as a regression fix and for stable.

Applied this patch for now (with some changes to commit log), as there is no
clean way to fix this for now. Got reports from other folks too about it.

-- 
viresh

