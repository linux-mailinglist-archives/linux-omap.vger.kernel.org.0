Return-Path: <linux-omap+bounces-5374-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F87CFC227
	for <lists+linux-omap@lfdr.de>; Wed, 07 Jan 2026 06:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1D97305D925
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jan 2026 05:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3431A26ED28;
	Wed,  7 Jan 2026 05:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sWywaJas"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A36260580
	for <linux-omap@vger.kernel.org>; Wed,  7 Jan 2026 05:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767765467; cv=none; b=fC2Udz27NQIr/P4dcAwhjH2F4Bp+BcE2t2EgYpIf1i4jEi/NQKq/zGu+fzP2AmHxBw2QbYRlBY2Iv3Y0qruodwBMdjUPEG/miLPp6AU3VJqGRdFQkKxCKkz5q80hxX0wMdorbwA615nOY33lCwVXeitcII+SUvmhrmmffEgmp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767765467; c=relaxed/simple;
	bh=iOvdWPELyx+skLN7UXWLkA+/bXZVeSPWgX2ioqSAssc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCzbHyThmhX0LXuTpBE3f7DcZpMaMQ0GyL5RP8AzyfUgp49Olv8ZB+JoBPzY6jfczbWfRof4cjN4B+8eDZmyWFRxGlS57zMn65inq5y4VUYZXdTHj/FkB6M6gEyUKatI7t1spM/cgNQQaFWOQ9y9o9qegQ7YBmDXNtwalDh5Zx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sWywaJas; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c03e8ac1da3so991927a12.2
        for <linux-omap@vger.kernel.org>; Tue, 06 Jan 2026 21:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767765466; x=1768370266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LC0H7XXkEOYKc23QOgFpX3RRHegQ2qJKsip88CL9K2Q=;
        b=sWywaJasLS0e25dnLyTHRyLKKNw/GbbpcHZjHXsQtmWlL2D2mPJscklhT8TNgv4x70
         NW4dtQd/N5uGbgm2WpXWmmvQPIgKz6cRelmm2hLfKT6EX+CgfJwkEL3kHwSRcHLywlSi
         YvLmZe9RUIeNu6je3R/VhYp4WsJS54xWq4Qjj6jLUSf5om57IP3CJWOdxbFX8KkX3L41
         aWk8ss69lN/kM/m0lk8g7MzMhwCm932F4UmZvck6j6jV28np3LxfUUkovqSQhge6J9m5
         jgd5o2RXUSs2Svf/JSrKTna7tmXscpCj4SWiIEqjsJ9QPRrd6YfD5FEkwPagzL3aa8yq
         gZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767765466; x=1768370266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LC0H7XXkEOYKc23QOgFpX3RRHegQ2qJKsip88CL9K2Q=;
        b=a43gHx1jzO+AmZnGZCrB72wLeBP3p/dcw/BpQuME0ggvuyy0AOUsOi+FPIt3H/9RYa
         i4qFg/ovikqo5sbBKGEzT1AMDStXQ/RU6JV36soZtQ/vEJuX85MAmpMxn/T4NAGg8LHr
         cyu0GaZOxm/N4mCNP/D9W8s1w6hOfFfK6SikyXobnO6sdeTQitf03JTIuTTgoAdcls8g
         tLnnZCbCoimT1ZW6VI+js5jfLZJycj96D/q3quAURLLECPEyMiR77VB1UtwljgHM8MIn
         lOSwPw/37jejNq1PwkjFUxBvZFo0jxYUanVIeL0in7dw2HkLtxHgLW1Ub+3OLJQ3PYk5
         pOyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqmIKCiTJ221YXQ4aXIXAw/ZNsTvKNjKjnecsP4TrohzVJ/7cGFjPiWx6ivrQ4LxzZXSer3cIFJQkV@vger.kernel.org
X-Gm-Message-State: AOJu0YwpYCMNO3uQdFE7ht/zBU/lB/lqMYoWtBBvzTiHdHGzdzECMnk3
	fRIURCoZNDEwxqhX/WqDbBaGkIB8BE5U7dww6l4OO+Pep5P4d4mMNw1qeYwQf3e449U=
X-Gm-Gg: AY/fxX7wJBNRhbRvmJwRDoJoNvHP3z/zW24KbWj+LXkuOxQT/+ccGx3pB7oPv3m8IkF
	Os+a7zSQKo4aceYy5iqL+TqRievXk9y0+Y1XFML/iWvgw3Y2eH2Xl4/VgUFu4Yk/qnPuhnFvrIK
	+ISOQJ02f1medaZ2mgn4WoClJSVhq578Y130wMGcfIiCMxg4dcuO7TtjyEORCUpvDuFhoQ64PDi
	TLqzbx95xeI1GwHfmIimUDDDzLIkBvZconKOmgluXA95W2zwXRzAHqcmI6jfE3EKlhbwyBn8/gD
	ZRUtq+/TvXTw3Chc4yHoDkS6QLK0KhnXnyjDr4NDuu5/aBOz2cgTyJWpS7xi83g/k2cmxvVdqu9
	oGW6DJ1Ap7JjHD3ak2Y3EQ5CsQ8KAcrVwtceyuXV8z3VuTENgpRMhdU/v0a8aqP0L6qctPFZcs1
	2ra17go0ynv1cFZTEXnEOXCg==
X-Google-Smtp-Source: AGHT+IHbKbuUiaGFKdL4diTpNeLR/j5eosCfbHWdAQ8rrrg+/KnQsIV8kE3nI8jz4VVgZv3B/kEBbQ==
X-Received: by 2002:a05:6a20:7355:b0:361:4f82:e545 with SMTP id adf61e73a8af0-3898fa1f824mr1336775637.53.1767765465528;
        Tue, 06 Jan 2026 21:57:45 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8d76sm38106705ad.84.2026.01.06.21.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 21:57:44 -0800 (PST)
Date: Wed, 7 Jan 2026 11:27:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andreas Kemnade <andreas@kemnade.info>, Nishanth Menon <nm@ti.com>, 
	Kevin Hilman <khilman@kernel.org>
Cc: Haotian Zhang <vulab@iscas.ac.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, linux-omap@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] omap-cpufreq: Fix regulator resource leak in probe()
Message-ID: <y2xyyyyhdoxflj4doa4y3a7prjqulcw63bdkor3fo3qsbmxvzy@dvhmfxkkzdqs>
References: <20251215030327.1771-1-vulab@iscas.ac.cn>
 <20260105101412.0ac7baa7@kemnade.info>
 <pjmwnxp6wae3bbmzmzys4r5szw6ywxphi4qtmpmg7jsqadc5fm@fvozoujr4mi5>
 <20260106182946.1c54d769@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106182946.1c54d769@kemnade.info>

On 06-01-26, 18:29, Andreas Kemnade wrote:
> hmm, it is performed when the device is removed/unbound, which does not necessarily
> mean the driver is removed.

For the cpufreq drivers, the device is normally never removed. It either gets
created from DT or some platform specific code creates the device for ever. But
anyway, we were both talking about unbound being called, doesn't matter if it is
the device or driver which is removed.

> But that does not prevent trouble if something
> is still trying to access stuff here after driver removal. So it is not really
> helpful.

It is not possible for something to still be using the resources from this
driver (like the global variables) after remove() is called. If there is a bug
in there, then that needs to be fixed instead.

> Hmm, how does a device gets bound to this driver?

Nice catch.

Tried to look at history.

commit cb6675d6a868 ("ARM: OMAP2+: Remove legacy PM init")

This commit removed the platform device being created and mentions that stuff
happens via DT, which AFAIU, creates the cpufreq-dt device instead.

So no one should be using this driver since year 2016.

Kevin, Nishanth, can you please confirm ? We should remove this driver.

> But the fix is good for stable. So I would propose to add this
> fix (to let it propagate to stable) and deorbit this driver.

I don't think it is worth adding to stable when there are no users.

-- 
viresh

