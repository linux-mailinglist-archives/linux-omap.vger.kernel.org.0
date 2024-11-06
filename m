Return-Path: <linux-omap+bounces-2590-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC9B9BDA12
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 01:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D753B22334
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 00:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF74DA47;
	Wed,  6 Nov 2024 00:07:45 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14753646
	for <linux-omap@vger.kernel.org>; Wed,  6 Nov 2024 00:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730851665; cv=none; b=DPjoj/PoC6oL/uC4RrL9MP47xhD/ZdWhW5Bz0Cp5ET7ZQ6OsziCFzjDW/Kp2t5ia06xZAZ7n2/MZf5nsafxd87iSUy9UmA16I7PwXYfKgtzKfzlLlbv5W0blHBk88FAkIqxz9ZymqEYLsHhL8k3VHih8XlUUt1bRen+DQhevEW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730851665; c=relaxed/simple;
	bh=kTwQqa9A+0mZlhRq0JYu1svWNqI6Y/8y5m8xeFZJU3k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tAmUIc04JuShdrakxvqpi2b82kOC4/XQYFKoi+Hqvnfd7Zhs9AeXDdKPfTy6oG6lOoYxorwKxWgIXjFpeOZglQzc4fSFdcBCFwbnw8tN7TS7ZnGRRPzGwvY5j8jDxmhqaUickrPC2OjakbcjkxysbuzcmGA2+a7fwnFL8YsK9DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso5440016b3a.2
        for <linux-omap@vger.kernel.org>; Tue, 05 Nov 2024 16:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730851663; x=1731456463;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTwQqa9A+0mZlhRq0JYu1svWNqI6Y/8y5m8xeFZJU3k=;
        b=ta0xGA2BnTYfMIkZz7Zj21jkLdR/8955+u6pztrQjtKBRoH/SzEW5gZwheKQOOXv3H
         uOxWd9VhVGsLnfbrNp1EiyClTR7MxqBetrQjM4iT7+cvuTfCluk7lPAFrt11V/fghyub
         QfqCkxKFkUKlYZOKW7WUkPa6tUrbAQ680gojSBHzFX9ICaVwH0rCial7VGnGbuF/P/VT
         +OollSovA9e3K/0iXx+pHpZRuzldns5DiGboDLFKkOaUEs+uhUY+Qkwu/o8xAVqI37RM
         DUDdZ9L16wfz9yMjDLuLzW9gNzdJk/eD7tqy2WKM8MCcxgd2rG+8VWAdMWw+rOqfj25K
         OWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVyIu3XzQ5NNY1FbQre+9mnuPnPgBGga+2Tsk1m1fraEgGqm7hKYagiJmholu5L15mUT9oN7sbO+jI@vger.kernel.org
X-Gm-Message-State: AOJu0YzAtGb+8I2EZkWFuQRJTnJlJziwevat5/cnIvTm+pfBfVsDnKA8
	luZ0KGIbqprL/eVO/UzjMbRI7HkzFT6TUHRJMscv1vlym8CuWTl8P46ruQVaAZU=
X-Google-Smtp-Source: AGHT+IF2HQi/kddQ3FnPSxVXeVj8o38xZLdTphcs6EJ5ybOliVMZNihzO+Urim3X0QKInzH4JQmNGA==
X-Received: by 2002:a05:6a00:3e16:b0:720:2dbf:9f60 with SMTP id d2e1a72fcca58-72062fd6edfmr55003071b3a.16.1730851663371;
        Tue, 05 Nov 2024 16:07:43 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ba19asm10395890b3a.21.2024.11.05.16.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 16:07:42 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Judith Mendez <jm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bin Liu <b-liu@ti.com>, Judith Mendez
 <jm@ti.com>
Subject: Re: [PATCH RESEND v2] gpio: omap: Add omap_gpio_disable/enable_irq
 calls
In-Reply-To: <20241031145652.342696-1-jm@ti.com>
References: <20241031145652.342696-1-jm@ti.com>
Date: Tue, 05 Nov 2024 16:07:42 -0800
Message-ID: <7hv7x1jkc1.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Judith Mendez <jm@ti.com> writes:

> From: Bin Liu <b-liu@ti.com>
>
> Add omap_gpio_disable_irq and omap_gpio_enable_irq
> calls in gpio-omap.
>
> Currently, kernel cannot disable gpio interrupts in
> case of a irq storm, so add omap_gpio_disable/enable_irq
> so that interrupts can be disabled/enabled.
>
> Signed-off-by: Bin Liu <b-liu@ti.com>
> [Judith: Add commit message]
> Signed-off-by: Judith Mendez <jm@ti.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

