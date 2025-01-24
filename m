Return-Path: <linux-omap+bounces-3205-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F7CA1B395
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 11:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92F8C1889C4E
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2025 10:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4B91CEAD0;
	Fri, 24 Jan 2025 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="yGSQ+xHO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12161CDA01
	for <linux-omap@vger.kernel.org>; Fri, 24 Jan 2025 10:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737715021; cv=none; b=A2RKFXTr0FgMg29eWash08ObcomnhKUStJpfxJl7RJLdMcMOJLHH0ugXS8D2JQqZG7zWsPKDdF6nX9pOk9fGbswh5IfMQTjsEG4BSA4b5V0yrW7FysthkO3iUBUdpvxj9chzLaLgJCfB05xdocOQkH+uBbcvCci82CfPjYivv98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737715021; c=relaxed/simple;
	bh=ccIvxLHoKpTx1/8tkfp7al9tb1JQeF8Qm0KkvCLRzAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZ+7xMrKst4TsONODUz94L7BrNYl7iqGE5GZLGHVcYtir0lddXz9gOdFg/W0s+HKnhDmIWkdO8PUpVmTKPg0Jx0DsDBRdJpH3WnkFxr5H1we6+4dhxAcAqoCrXHuZ/W3BuEs+kIyjPdUXKlg9avd+twIg0pT3tQcLDmzreH5aWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=yGSQ+xHO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so1650662f8f.0
        for <linux-omap@vger.kernel.org>; Fri, 24 Jan 2025 02:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1737715017; x=1738319817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfzXbiuWN/qhkMVLVFhWWFAL+nq4OjChZkKMOhzHSGw=;
        b=yGSQ+xHOX9jj0HvENfBa/+kGFNQdAxtI5fadH06SmeIMteNyUKhPtU5oLnUGzUypIF
         IdJJRKKdPmQ6xaFCv0o5NCS0lkUfc95OUm9f4T8sTpvT/by7vHeCS//VaedMGjs7W6pb
         +w1PttrFZgB7Ta7nNEhxfz+wlQP2wzx3N2r6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737715017; x=1738319817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfzXbiuWN/qhkMVLVFhWWFAL+nq4OjChZkKMOhzHSGw=;
        b=Ki6CMYGavx+iZnhtSB8Q2ZRg7oy6q9k1Yg8V3rgQHugn+sfQbU1mOj4fSt9NbCuooE
         JiPZ2jD8is092Kjjb2bndJjfhQtUTjpJ/5feSfdCrx1ycYlyrEpZ/KHHpa2ZAiY3PcQY
         l0nKMth9I77wvn8lGZt7+muq/oM0C1KYrXmWYzgvvvyFFEZKSi0l+6yvBgW3fd1TKK0F
         /NZo0eYMLIYn+bpeTAHTJzD2cek3jNNXp4KDgJKCo62GrJcndXBWTxrK0GRVqDDAw7ut
         +4ntA/GhApVtnjGDAvR+m5RM/r8gUAEFC+BIm+7HragUlQFyXsNrA8EyvC+0b9iVKCV3
         tHLA==
X-Forwarded-Encrypted: i=1; AJvYcCVHCHforwB6TveluS2SZG0Pv582cpH7nYTQjEGsP9bIlYdS3TTHQJj7G2A8jtRHtXmpVY3ivGB/0fyf@vger.kernel.org
X-Gm-Message-State: AOJu0YymYcS2w0UWqXAVysmSZWlO+CXOaI0fAYxDCh4rQcM4Q41R3+gT
	kN+Xabiyp4725zuVtd7AEcC4Avr/y7RHODr0BF9N1NiY/BzCgau1QLuy4dbmy/c=
X-Gm-Gg: ASbGncsRbWlFvwpdJud41hpkhfB12qeSIaNbHTJVjempqxxGgfdnGopX73tg2fZt6gW
	pLIan/5xvMpv3CsN7Ps2fQajORgiI4wcZny0gToGfb0IYpF0X4d+5VtZsWj3+lowRy2ONv/Ff7Q
	061lDs0/5b6L24MEX2UAcn093YDwgZ8VvNB3FY2Y0FZAlDZiau3AMmqEn7NmECnTtVMAgi5xjVn
	ev/lQzUCLW2+az8X6Lle1qZB+Xmi0282CZwG9hyKF2N5K0g7rUMkpbmYbNpGvnlVM6fjsncjK5N
	DAhEPOCe6s/gSqZeS7of1T+E938Rkis7uDw+74EKg8bH6heVzPi5Db53je9vyjphRCBIU5iTHxX
	3CcZSDtJNoCW/wHNcVnm80YbK6sx6aebPjjPg95Zn
X-Google-Smtp-Source: AGHT+IHPrFf82v6k6SzKmhhNFnGZ+58JJbF3E156m6NSbU27wCHC8adaDkce/j7KdTcAIdd5H30LEg==
X-Received: by 2002:a05:6000:1a8c:b0:385:e5d8:2bea with SMTP id ffacd0b85a97d-38bf56639c9mr25899644f8f.20.1737715016810;
        Fri, 24 Jan 2025 02:36:56 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c3994sm2212888f8f.81.2025.01.24.02.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 02:36:56 -0800 (PST)
Message-ID: <f6732c49-a5b1-4a13-b9f6-c2d552b5e7e8@smile.fr>
Date: Fri, 24 Jan 2025 11:36:55 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sdhci-omap: additional PM issue since 5.16
To: David Owens <daowens01@gmail.com>, linux-omap@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
References: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello David,

Le 23/01/2025 à 23:09, David Owens a écrit :
> Hello,
> 
> I have a AM574x system and encountered an eMMC regression when upgrading from 5.15 to 6.1.38.  The eMMC is using mmc-hs200 powered at 1.8v.  Reads from /dev/mmcblk1boot0 will return expected data except when a delay of several seconds is inserted between reads.  With a delay between reads, the read will occasionally (~50% of the time) return garbage data.  Using hexdump, I was able to determine that the "bad" data is actually coming from /dev/mmcblk1, not /dev/mmcblk1boot0.  The same thing happens when reading from /dev/mmcblk1boot1.
> 
> Much like a previous report in the linux-omap mailing list [1], I too was able to correct the regression by reverting the commit "mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM" [2].  Unlike the previous report, applying the sdhci-omap patch [3] did not resolve my issue.  Only reverting the original commit allowed for reliable reads from /dev/mmcblk1boot0.  I also don't see the same I/O errors mentioned in the previous posting.  Reads always succeed and return the correct amount of data, its just from the wrong device.

Interesting, can you share a test script to reproduce your issue?

Why 6.1.38? nowadays the 6.1.x stable is 6.1.127 already.
Can you test with the latest stable release?

I believe this issue could be reproduced on the beaglebone-ai board (I don't
have it).

[1] https://www.beagleboard.org/boards/beaglebone-ai

Best regards,
Romain


> 
> [1] https://lore.kernel.org/all/2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr/
> 
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3edf588e7fe00e90d1dc7fb9e599861b2c2cf442
> 
> [3] https://lore.kernel.org/linux-omap/20240315234444.816978-1-romain.naour@smile.fr/T/#u
> 
> Regards,
> 
> Dave
> 
> 


