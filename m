Return-Path: <linux-omap+bounces-3427-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356DA677BB
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 16:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 611F6170529
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 15:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C0120E70A;
	Tue, 18 Mar 2025 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QAY2cGPJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597B128FD
	for <linux-omap@vger.kernel.org>; Tue, 18 Mar 2025 15:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311672; cv=none; b=ikiXGWNExeEvUNVAPp3qbrMkrSm7xF5/zLy/1HeskoCkok7S3KWs9EW62o/F3cnL3ACQLhP+wEwBBdSP205Ahv+izsTZGWduWmKM1B+5eg6WqHbyGDt8LczJLvscnIRXBozfj95q/ImffdDEvsjDUilPZSm1DanEX8+d4Fud1/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311672; c=relaxed/simple;
	bh=s9zh/0nQb62u7isnT7ZTZOjoOHQLd+KLI5aGXQFTu20=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zygb8+P9Opv1JrZhXLfrFSiLkPA/UWr6VPCkJVwpAB9ck4G5hAfY9SXvNMF4rYWZpQ7AohRXVX38YAEoizBHBs4SVGJig/NgTLyo0BYw+ExJCbLhSol4fySkLsJttVpLyhnBZzChrudfNEmO2ld4YYbxY7jCAzQtBJX9U/magYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QAY2cGPJ; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2254e0b4b79so6591625ad.2
        for <linux-omap@vger.kernel.org>; Tue, 18 Mar 2025 08:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742311667; x=1742916467; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t9UzD1Ky2bx9uaDef0qVlKrUGPVh+KVmS6RPxnxKCs8=;
        b=QAY2cGPJBMEoqMLkIBw1uTZ+ylnQeRjmsd3tWn/PXK3hkfouIoE8ZuYdEIBqq05ClI
         SvrIuW6SkU32hkQUyu7m9SDNRG8SAQHJjXMhckzuuSY97t7MaNh4Pzx3bKCtYIB51rIS
         yXkN/TzJdkwkNlVxmm2XvKPevwqCw+B3T1b9yWdFfLhf1/wWevEXSkkrK0TflObXOf6n
         LK1doJtAeYbldxIawf+1RE6YtkUAo2wGxAxdsUK7D4FjtOOvFxL3Wfxts6fgzbvB+awo
         aARLfzriLHgM/2P14vsvpvarB9NbP1EIu1M0baZ0P3EdkLYXceKwAgzE3uKL02nYMa5A
         SinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311667; x=1742916467;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9UzD1Ky2bx9uaDef0qVlKrUGPVh+KVmS6RPxnxKCs8=;
        b=rua8JL9bkzKS3gFUvhumNkMBAz0arqV9Kag32XrEGYPXUVW6tClKumwjGbzTjqFhT6
         FZb/b4MJjsfS37JG4eo6cjoHXs6wB+KZqAqW1lfN0mUYlp7XuiNTIiigsTk8JJlAkGH3
         rJWVBg1hSixhYPKE2k7yHFixeD/VL1llzn+3lx4i/Th9r1tUY1VnlthTSRh0gg+vz4pZ
         tpR3sPuNA3qjWD86q6+R0x8D8hRzr0+vkPqFkB7vKsV0ptgMR6BysjKdaaATVcQlUxDG
         hRwXpJqTQzusv5bxCJkMgvmqKjuyVpWwei6d8I8oaMtAo7TZYQ38cr2+51C94hlvhde5
         exHQ==
X-Gm-Message-State: AOJu0YxE8Ir4fpNbzb7S12KGwnhMLp8cYRz96IRuXvUk/kwwIxjk9yTb
	dMwTCUc4ooIHod3oS5TnPnTGEr2/FWTOgWge9V7lmiT2kQi2VqDleH48HDg8eZo=
X-Gm-Gg: ASbGncvQe91bdWeCbV4IPuvWkZxe+lzCcDNISmBYZgPc6s9BDpZ88YEj6VUA/uGlAig
	FhYsnPQfFCFIu7n5+zPkVqVwL/ZgJCo2plwgsRh56ABUWLCgJ5VqQ1Fj+sqfsf46Cgpy7OnKAen
	+Ar74SJUugaFzcd15XVytE3MY5zzJ9wxEKyhBE2A3xojh/fe3mib3quFzQyFxltTuYgCb1elrNM
	qNYImdgRPUsrGwRtkFJO2dI34N7RTbGBpB5YDxj/mxaSnO1JY66rcA/LVyHqFwMZnssZhB+8iS0
	N/99Ggrr32Z92pjshkKGXJLFvIJSDOC17QmsoxBcnWWkOHF66G7IUA==
X-Google-Smtp-Source: AGHT+IE2D/VJp57Hxl9axDzo6oJNvumHjtvBrJ+oZN2PEHsYJkVXPJxJR8fnVya7s6LHOzxTsDuPTw==
X-Received: by 2002:a17:903:40ce:b0:224:2717:7993 with SMTP id d9443c01a7336-225e0b0ed1dmr230864945ad.45.1742311667265;
        Tue, 18 Mar 2025 08:27:47 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6913sm95848435ad.142.2025.03.18.08.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 08:27:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: OMAP1: defconfig updates for v6.15
In-Reply-To: <7hcyefqzt2.fsf@baylibre.com>
References: <7hcyefqzt2.fsf@baylibre.com>
Date: Tue, 18 Mar 2025 08:27:46 -0700
Message-ID: <7h4izqqryl.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Arnd,

Kevin Hilman <khilman@baylibre.com> writes:

> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
>
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.15/soc-signed
>
> for you to fetch changes up to c2a5f8c4f28ffea8c93d10e509c5a6e61172cdca:
>
>   ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP (2025-02-05 16:31:37 -0800)
>
> ----------------------------------------------------------------
> ARM: OMAP1: defconfig updates for v6.15
>
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP

I see now this one was already included in the arm/fixes branch of the
soc tree, so you can igore this PR.

Kevin

