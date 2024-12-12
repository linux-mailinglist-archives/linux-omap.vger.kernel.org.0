Return-Path: <linux-omap+bounces-2811-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E7B9EE91E
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2024 15:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74AE2287E0A
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2024 14:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4F521B90F;
	Thu, 12 Dec 2024 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hoTk6hFS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45D0223C66
	for <linux-omap@vger.kernel.org>; Thu, 12 Dec 2024 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734014310; cv=none; b=XZL0NRE+VGpoPfzT4gHvNLhgXttJiTW6cJT1FTToAYFYJJdDjpUXlfUbg5dvIRF8cWUZZhhEuZVxOsZ2RVAEranlz0Ts1Fiu7sSbT/+NHOfQmJdOSG8G5IVCuFXFfxTH1dQvBhOme1RjcICab7fKaLtLOI3WB4Y99Nh78g8vDcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734014310; c=relaxed/simple;
	bh=85oMj2fZoa9tv2lnOop9OuEYiv4tSNwyvlVAgPEcKBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DkpkhTuhleJhatLLD2hwzMsEc5ZP0zToR+CIQLkoDwerAS8zMqhrZMp3km+rYqZgWHvHMOwmHRZCyKi/lpHRwjBJaYSr6QNIHkD3HfdqFG/mvz1WBz8P7UVNV0kU3I8sKMu3xnRwG15rwAOwuCRqF+Cb6Jl4Ualr7lIUXFpslUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hoTk6hFS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so299881f8f.2
        for <linux-omap@vger.kernel.org>; Thu, 12 Dec 2024 06:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734014307; x=1734619107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIOlizfCIWzvmSjIRb9eyhPMVHCE5sYO+dZRoNpnJeg=;
        b=hoTk6hFSQWWygcYq/RLrtyBUJM7DzMrnbCbIwefYd7Ro01Nlfe4anlx6abVHfaDBRU
         WHFxrhcfUQjZx8pp0uckNATFAB94OOgwVY+Cs9SpM2iLY2TvdUqgfWwXSmvcKcqfyYiw
         Sd4KF/jNE9Bws1L3oactSDHu0uN+67XZfPOa86SHhdq1BePl+pVesHAQshN28vfvZqJQ
         /T3TaW6V+LfXXF5ZutUq2rEWo/CAK7RPAPYo0YKRSAAVL5X82GjiUIs+3TwZmnuwWCHw
         R0Ts+cmBtlAQV2zKw5N3/NDfEvVAB8OJcdYDKm/Cr/3/paspHKFdqLbRqS9PBAlnfmW4
         SXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734014307; x=1734619107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIOlizfCIWzvmSjIRb9eyhPMVHCE5sYO+dZRoNpnJeg=;
        b=aTZVh2wUpseNAgsjaS+vvnLBOe5IwqP8DzwVj9XynIDqS2YgECxa5DeoDI67HMMlHe
         ISjfq0TvemOsew0BnnpYwOADf1iLzRIj1miQqL1phcabdEgIH7lw21n/vPzozpZvD5+Y
         2hhM15KriVwvV9EzjwccrC8kZfkH18dAuI2jQ8D6rTGHmsFXUN6y8xkBacBBB5XXGZ/w
         NqMO0yYdbY9XSeRES4uY7WVn+sBQKGk3jX6VM6UC6R29zC9BSCjFvnYYSqPQnSrIyYEY
         FIvE4Zl4SZP4PFwTWya4+WmbX16Jb5SLdACZN5rG2/LF/N+xZRXUpJfmpWvQBP4LMpQm
         WfvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4lr8u+QUJJh+PJj0Hr8Tv+Cvmo2VegogYbPTS2SvZhDHAm4aGquDP5mv0F1LWSrwL0fn6eIJzB1Ms@vger.kernel.org
X-Gm-Message-State: AOJu0YzjIqwMjzqOZafc5ookL2NZ1Gk1QkUZX9PLGSEziamA6wFNBmsc
	ZEuFjUpyCLrGm9gvshhkB1zVz5LXCPGlBPRDvfSC0M+zEjyCQWYmxh6ZOHhfHWc=
X-Gm-Gg: ASbGncsEE6q8L7iLu/bMNtlVTJ3qX6+2o0tLC7L1fWpIh2g8qFjSqGYhZ4aB2smuqrE
	OvusZQN6CUxhNz+CZqyKOQmg8qDe/Uw8HL9INeYYDIYT4V8s5ghLriqudtDed3UM8C0J3IbrfHb
	FUxj6gYlvrV3AGN7gc3tNM9OWLnt94fes0MoqaE2s5l/5eNCflqI91CC7J1NMQwZjXofr4R+w9i
	A3frCwHf5gkbBODRgI0W5KE4ar/Zx8QM5lRL48Ubr+xxGOJbt3QoJrR
X-Google-Smtp-Source: AGHT+IFds6b+rb/IVEt/FaqatdXbo9IXwM0+rdLbsbHi9Vl/oF4STGa7tMC6n4HsFYumZKjKywdEZQ==
X-Received: by 2002:a05:6000:156d:b0:385:df73:2f3a with SMTP id ffacd0b85a97d-3864ce5429cmr5944931f8f.14.1734014306975;
        Thu, 12 Dec 2024 06:38:26 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:11e8:e55a:1c06:3078])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559edc3sm18681545e9.22.2024.12.12.06.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:38:26 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andrew Davis <afd@ti.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: omap: allow building the module with COMPILE_TEST=y
Date: Thu, 12 Dec 2024 15:38:25 +0100
Message-ID: <173401430334.14078.3117546385632251439.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205120610.40644-1-brgl@bgdev.pl>
References: <20241205120610.40644-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 05 Dec 2024 13:06:09 +0100, Bartosz Golaszewski wrote:
> For better build coverage, allow building the gpio-omap driver with
> COMPILE_TEST Kconfig option enabled.
> 
> While at it: simplify the dependencies and drop the dependency on ARM as
> it's already implied by ARCH_OMAP.
> 
> 
> [...]

Applied, thanks!

[1/2] gpio: omap: allow building the module with COMPILE_TEST=y
      commit: 934bacb6441afdb77093a46b3138f81cbcde7d81
[2/2] gpio: omap: save two lines by using devm_clk_get_prepared()
      commit: b7bbaff8c1bccf48958e52f6f03593fc47906b5d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

