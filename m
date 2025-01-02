Return-Path: <linux-omap+bounces-2944-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13206A000AC
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 22:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D90E43A3407
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 21:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944431BD9C2;
	Thu,  2 Jan 2025 21:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vhbZpQIw"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478751BC061
	for <linux-omap@vger.kernel.org>; Thu,  2 Jan 2025 21:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735853494; cv=none; b=ZJVbam5rfknhB+5uQqjXcj5YX13o/gVCX+tWBL1DVhMh2HpB6Oz+NtA8Lhr3FtRvxXWRW6cnwth7+LjX0WElxx6iUP0SgjOjFjjjiE2PNpRXzZnqsrPqH+vaX4I+m4loqFDs5qU0oH/JjMZA2xZzobZDFIMcubVCz3J9WxAr5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735853494; c=relaxed/simple;
	bh=NnzBHzwJl1oNYm0MW1+GIWbuimntCPGF17uTfgGopJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lthde3LXBG9s4zJRJEm1Q2M6A4f4OxOu43phZSHSMuLtRit9Ro5nPTiW1SWvSx9lFDcqgyk2ZbkLu9hOaYfGag8nxQ/5yb7bmob8rpWYucWfXL4QZtyS3t1e7ACgIpaNfCnYU4B4qblZMCgykY9wPs6whWO8vOlTfSr7Vov9xd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vhbZpQIw; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so12867453e87.0
        for <linux-omap@vger.kernel.org>; Thu, 02 Jan 2025 13:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735853489; x=1736458289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usBhbRysbrNPNt+dCknWS9a6GgYpIUw/Jl5XkjavJKY=;
        b=vhbZpQIw/bLF/xOXzHbnkMB2K8Yg0wRHcVdL7yqaOfee0TdPbVwroRLJqJ0tyOgjX2
         d/AV2QJC6rGQtYevd41ZnnRhxHhB3sh+wKcfudu4ste9zBQp8jjStrojEOYF2riXp2hD
         3YKoo+YHJvvWMLr4k/C6A7rzutyk5rXi8+x7fL7dwo8tqIWhZzoJpJfqnbMsig3CtV0U
         vzCabq91YHQgsgVhrEpLN7iHw4UJnoE60RebD1PdPeNs6zX67PRh3bftmtZzAzZ2PRb2
         2Gf2/cGm8HdH8/ImxnI6nkPZ2e8oZsuTo8HLnZ1I5X/x2dq/A30yFoxmk9Fn15aFxLNe
         twlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735853489; x=1736458289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usBhbRysbrNPNt+dCknWS9a6GgYpIUw/Jl5XkjavJKY=;
        b=spY+OY0+WF3joHwH1BoF3y9XlChsWRRxQB7mZBVQahtAPeu/1HVMzcFUjArLjxlVX9
         lZj7QEk/3GgC2CvMvMtsFCRK51+K4H4IJrfs3uRfo1pJKdAcFY6Im3bA+oD8Jq62ehPk
         VKqY2Tlh7B+qN/Nxi4B6ht7GCENXypuWH+kIH30fBSioaLziK4FOKw1Pqruxvgkxjk+A
         EKOVP91lgYvWONI1gSIzMM/1L38RatmvaNVFrATHb6iJNL+/KzQnSBOs0DXwGPVlSrKn
         m7lY47veTHhfzI21FYiEi311Grf5HXYuZbyJHDZAdJ/F3RqrIy1PZXXzf5B/4H54TLL9
         8yaw==
X-Forwarded-Encrypted: i=1; AJvYcCV1r0FnkqNlWGf9QiYIxSVMm/WBTKjBnzgaVjh9fPEtKSnL/0kbtzh70VTBJw8DFaP/fX0xiY75R63n@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhy9I+nlgpf5+HyWpdQoMjP1+Beq3uM3IxuIjqOxRGV/Vb+A12
	xdJv+jZCAWHkmROFvXJqQlMlyxPLwDH87tzfT/RkpDki24RMGiN6XUntQJ7MnuJqJFry27tsAP4
	/QdmxqkjrO1xV8sTVF67Efma62AoBDff7oA1wrA==
X-Gm-Gg: ASbGncu6f+6Y4sSvVnUjl1oEDSEnwQ5v2nRhiPbxhVQB/LCwveeJsQ1cMwJJKJFEiNO
	S/Am/u5u2kEfQqIsQHIoUIVru5ySWTI1Z+U+K
X-Google-Smtp-Source: AGHT+IEfQcmpt4yo78zeyiW21woV39R54BV3/zwpN1Hk/I+z3wEi50BsJMs8YPoW7H7kJj4xx3h+r/iHcsMhpVtWva4=
X-Received: by 2002:a05:6512:3f0d:b0:53e:2f9d:6a73 with SMTP id
 2adb3069b0e04-542294aeacbmr14066905e87.0.1735853488948; Thu, 02 Jan 2025
 13:31:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181953.1020878-1-aaro.koskinen@iki.fi> <20250102181953.1020878-2-aaro.koskinen@iki.fi>
In-Reply-To: <20250102181953.1020878-2-aaro.koskinen@iki.fi>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Jan 2025 22:31:18 +0100
Message-ID: <CACRpkdZP_KnRRUO2J9a6jWCCBs8wzX=ct8rRW4jnFATJ2hZh5Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] fbdev: omap: use threaded IRQ for LCD DMA
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Helge Deller <deller@gmx.de>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, linux-fbdev@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 7:20=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi>=
 wrote:

> When using touchscreen and framebuffer, Nokia 770 crashes easily with:
>
>     BUG: scheduling while atomic: irq/144-ads7846/82/0x00010000
>     Modules linked in: usb_f_ecm g_ether usb_f_rndis u_ether libcomposite=
 configfs omap_udc ohci_omap ohci_hcd
>     CPU: 0 UID: 0 PID: 82 Comm: irq/144-ads7846 Not tainted 6.12.7-770 #2
>     Hardware name: Nokia 770
>     Call trace:
>      unwind_backtrace from show_stack+0x10/0x14
>      show_stack from dump_stack_lvl+0x54/0x5c
>      dump_stack_lvl from __schedule_bug+0x50/0x70
>      __schedule_bug from __schedule+0x4d4/0x5bc
>      __schedule from schedule+0x34/0xa0
>      schedule from schedule_preempt_disabled+0xc/0x10
>      schedule_preempt_disabled from __mutex_lock.constprop.0+0x218/0x3b4
>      __mutex_lock.constprop.0 from clk_prepare_lock+0x38/0xe4
>      clk_prepare_lock from clk_set_rate+0x18/0x154
>      clk_set_rate from sossi_read_data+0x4c/0x168
>      sossi_read_data from hwa742_read_reg+0x5c/0x8c
>      hwa742_read_reg from send_frame_handler+0xfc/0x300
>      send_frame_handler from process_pending_requests+0x74/0xd0
>      process_pending_requests from lcd_dma_irq_handler+0x50/0x74
>      lcd_dma_irq_handler from __handle_irq_event_percpu+0x44/0x130
>      __handle_irq_event_percpu from handle_irq_event+0x28/0x68
>      handle_irq_event from handle_level_irq+0x9c/0x170
>      handle_level_irq from generic_handle_domain_irq+0x2c/0x3c
>      generic_handle_domain_irq from omap1_handle_irq+0x40/0x8c
>      omap1_handle_irq from generic_handle_arch_irq+0x28/0x3c
>      generic_handle_arch_irq from call_with_stack+0x1c/0x24
>      call_with_stack from __irq_svc+0x94/0xa8
>     Exception stack(0xc5255da0 to 0xc5255de8)
>     5da0: 00000001 c22fc620 00000000 00000000 c08384a8 c106fc00 00000000 =
c240c248
>     5dc0: c113a600 c3f6ec30 00000001 00000000 c22fc620 c5255df0 c22fc620 =
c0279a94
>     5de0: 60000013 ffffffff
>      __irq_svc from clk_prepare_lock+0x4c/0xe4
>      clk_prepare_lock from clk_get_rate+0x10/0x74
>      clk_get_rate from uwire_setup_transfer+0x40/0x180
>      uwire_setup_transfer from spi_bitbang_transfer_one+0x2c/0x9c
>      spi_bitbang_transfer_one from spi_transfer_one_message+0x2d0/0x664
>      spi_transfer_one_message from __spi_pump_transfer_message+0x29c/0x49=
8
>      __spi_pump_transfer_message from __spi_sync+0x1f8/0x2e8
>      __spi_sync from spi_sync+0x24/0x40
>      spi_sync from ads7846_halfd_read_state+0x5c/0x1c0
>      ads7846_halfd_read_state from ads7846_irq+0x58/0x348
>      ads7846_irq from irq_thread_fn+0x1c/0x78
>      irq_thread_fn from irq_thread+0x120/0x228
>      irq_thread from kthread+0xc8/0xe8
>      kthread from ret_from_fork+0x14/0x28
>
> As a quick fix, switch to a threaded IRQ which provides a stable system.
>
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

