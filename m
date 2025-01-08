Return-Path: <linux-omap+bounces-3038-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6A8A06992
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 00:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 850BD7A1A0A
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 23:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12ED8204C3A;
	Wed,  8 Jan 2025 23:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="fQSV+bdD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95B4204096;
	Wed,  8 Jan 2025 23:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736379659; cv=none; b=RHiAspysvwfaOjnL8a2yy8axWstbJRF2k49bzJqqfIEofYDRLT2dq+S4WnNOwq8AlAbpHVvBrTFGzsK7xQdrDvg49i0zJNV9LRM4k1pVpc45WhZVnAeOXa3pv+96MKB4oll2mWsf49nIPpQqptiUOBkPDhH+l3juC17t04iYuZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736379659; c=relaxed/simple;
	bh=TYnWxGwB7nqono7r3DakQbYaISqvAz1eEt3JuW8hm/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdjpTfOhxLl/ElOnxQ9w1Es+nf1PHNriVo9K2khlT57bvXYB1h7clF9XPnlokUVa5Oxze12xH2m1mS0Q7fMaTZrwZbQNnPsRIGuGPqO94YwAkyWusuKhHwKvaWESmKTicgAb43G6X38Vl9CNwZKeDSk+oA33r63OoQjsJ05gSCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=fQSV+bdD; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736379641; x=1736984441; i=deller@gmx.de;
	bh=0cHjUL8zGlsJFwUhzPi0uaR0Fl2umgMbcNyeig/NH5I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fQSV+bdDY6EKiRWy32MdWzFbhbmPP7gZdriNRT+32DMhvLdNu9rleoLlR2BHkRca
	 NxqdUNwd2wZqccLPNa/qPBMoaMwgnhSy7sjMcLeKQeblfIdEyPdcu/wlYseVtMCex
	 5mdsYpS+r1UJyiAjnBzAPUzmc2dI60h0Re+O38BPIWHwTDphBzulFosMu7DDCjZmT
	 sz5IOp05qdBLjkEpWqTEUkzICivlPuNtVKkWUp9hszV0CtY+QpM7/Xq4wOa32sEoL
	 84MqIrTFv4s45TxXcM057+wqAfYyQ95Fzf1FubBwIv8lJW3Wz3IoK50FPQkehVC5Y
	 GUXyzJX7tCqBRtG/AQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([83.135.220.169]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3mt-1t2LSs2vdb-00PDUh; Thu, 09
 Jan 2025 00:40:41 +0100
Message-ID: <c264ce16-fc55-4332-98d4-234860c318e2@gmx.de>
Date: Thu, 9 Jan 2025 00:40:43 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] fbdev: omap: use threaded IRQ for LCD DMA
To: Linus Walleij <linus.walleij@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250102181953.1020878-1-aaro.koskinen@iki.fi>
 <20250102181953.1020878-2-aaro.koskinen@iki.fi>
 <CACRpkdZP_KnRRUO2J9a6jWCCBs8wzX=ct8rRW4jnFATJ2hZh5Q@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CACRpkdZP_KnRRUO2J9a6jWCCBs8wzX=ct8rRW4jnFATJ2hZh5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mS9hyuT9SDaf3PKlYoJXazxVdjBRlyFAvqCYRTrrNIk+mkT10uV
 qxf9Zg6JyNOiTv81BpBETBd9p60GwFLxSU+BiFQU1O26YYVUdl4dqmzTuf8NoiZ2idb+MUD
 9uawP2U8eom4PtltIQ8GSpzeOFzjqgr5/LJTAfJ/TVTHMlR/uHguW09ikyFIQw6mgb5gO50
 dnFvTC99ohGoMy+593KIQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:d1lLBXmoLqE=;SAXOK8JSdDliyAqMQe4ICAw1+KW
 yrlAwtmqA18o172qjURyw/rEqhm8Z4LFOIip9/W9Uh2G3HS6zeECpMitb53WCgUODKtRrfBX5
 MOsMV1B6FcMmCriQWJXQ1NvTsYOPFLt7KixS+4glct1aYtJvLlS2gd/968J9+9GyJdP3RwbKf
 s8yyvxEJ00nUYZFoBht0kcpb5V4a8NuHRJy1d9xt0hV/4nOgFKXBOFfYaEiLPWWbGW42Wx1qq
 PCESKxnUx5zUcfFGtnS0PW+Y4P26nWWM7BSIloEwX9wNVsgosJ/KCyAP7pRILhl7GzMJ6yte3
 xQI84/bis07dZC9oTBs+hIaF8zQOgFP7QuVqmK6r/xU1JJKuSh3dvWCDic+lfCD0MprqdV0V/
 2VTI8FfbVwOz4X0h5YAb38K2uWhUmZbSgMHPreBWaVBLRqnQ9Ml70y9ZfpcfCy7jW+qw8ytOM
 JcLGVBsn6b2Hw3FDsiPYUJ2waamSC+b0JiUPK2ZlZQfzsxVLbmRoRmgFdqexYGz4eZCVKx3o9
 /JbORnmvkTuNg1eoRv59mNEBuEtqasSl1PILaIyt0BUPbwutx+ljN3uPIEUpwai/fTynipgJt
 FaB4eZ40lKAC/9N3KwWncijiltXn4IvGH1c95atKFMpWjHcLh+AGGCP34erbRI1HboZyjY/lc
 3sj43tcAyhhBrI09Td0nJ7CWsYwHrSzOsGiAcmAGSIYAmaXw5+Ke6kEVQEnaxetSCsmjR2w+W
 S2k7AdFS4RAryWcHw+6ctXgwD3a6ahotoa1YdQqHfIgioBRat1+ZlNkOU1cIlsiZ6rTfAZOME
 yinXxdvM8puN1mkZNU0w7gZdrZwN6ste2FnkCtn3j0r/Aib5nXAomUoksNW93IQLvfOBE6f6f
 4ZFGpO5xTv1JJKMJrqnXPGFkyxMcNvfnKJmD+kUfdpPpniiF/WX3cGpavCsD8TwoTj8o0okhl
 Hn+t6/UBLqTb3quikFJF+OTsNjYgGgewdWhbh1cXsKqE/yyJ5n0PeEpH3unyo7mXWWSn33pgS
 qXEvjbFrSdJpybOsfvkFqkogOjFjVlIbXAVtjk6eXLbHHHIDJPc1ZM+9Lu8Ri3v+lK81S3GLk
 2AMxrJT4nDw8VxgQJGkMAQMKc4DMvN

On 1/2/25 22:31, Linus Walleij wrote:
> On Thu, Jan 2, 2025 at 7:20=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.=
fi> wrote:
>
>> When using touchscreen and framebuffer, Nokia 770 crashes easily with:
>>
>>      BUG: scheduling while atomic: irq/144-ads7846/82/0x00010000
>>      Modules linked in: usb_f_ecm g_ether usb_f_rndis u_ether libcompos=
ite configfs omap_udc ohci_omap ohci_hcd
>>      CPU: 0 UID: 0 PID: 82 Comm: irq/144-ads7846 Not tainted 6.12.7-770=
 #2
>>      Hardware name: Nokia 770
>>      Call trace:
>>       unwind_backtrace from show_stack+0x10/0x14
>>       show_stack from dump_stack_lvl+0x54/0x5c
>>       dump_stack_lvl from __schedule_bug+0x50/0x70
>>       __schedule_bug from __schedule+0x4d4/0x5bc
>>       __schedule from schedule+0x34/0xa0
>>       schedule from schedule_preempt_disabled+0xc/0x10
>>       schedule_preempt_disabled from __mutex_lock.constprop.0+0x218/0x3=
b4
>>       __mutex_lock.constprop.0 from clk_prepare_lock+0x38/0xe4
>>       clk_prepare_lock from clk_set_rate+0x18/0x154
>>       clk_set_rate from sossi_read_data+0x4c/0x168
>>       sossi_read_data from hwa742_read_reg+0x5c/0x8c
>>       hwa742_read_reg from send_frame_handler+0xfc/0x300
>>       send_frame_handler from process_pending_requests+0x74/0xd0
>>       process_pending_requests from lcd_dma_irq_handler+0x50/0x74
>>       lcd_dma_irq_handler from __handle_irq_event_percpu+0x44/0x130
>>       __handle_irq_event_percpu from handle_irq_event+0x28/0x68
>>       handle_irq_event from handle_level_irq+0x9c/0x170
>>       handle_level_irq from generic_handle_domain_irq+0x2c/0x3c
>>       generic_handle_domain_irq from omap1_handle_irq+0x40/0x8c
>>       omap1_handle_irq from generic_handle_arch_irq+0x28/0x3c
>>       generic_handle_arch_irq from call_with_stack+0x1c/0x24
>>       call_with_stack from __irq_svc+0x94/0xa8
>>      Exception stack(0xc5255da0 to 0xc5255de8)
>>      5da0: 00000001 c22fc620 00000000 00000000 c08384a8 c106fc00 000000=
00 c240c248
>>      5dc0: c113a600 c3f6ec30 00000001 00000000 c22fc620 c5255df0 c22fc6=
20 c0279a94
>>      5de0: 60000013 ffffffff
>>       __irq_svc from clk_prepare_lock+0x4c/0xe4
>>       clk_prepare_lock from clk_get_rate+0x10/0x74
>>       clk_get_rate from uwire_setup_transfer+0x40/0x180
>>       uwire_setup_transfer from spi_bitbang_transfer_one+0x2c/0x9c
>>       spi_bitbang_transfer_one from spi_transfer_one_message+0x2d0/0x66=
4
>>       spi_transfer_one_message from __spi_pump_transfer_message+0x29c/0=
x498
>>       __spi_pump_transfer_message from __spi_sync+0x1f8/0x2e8
>>       __spi_sync from spi_sync+0x24/0x40
>>       spi_sync from ads7846_halfd_read_state+0x5c/0x1c0
>>       ads7846_halfd_read_state from ads7846_irq+0x58/0x348
>>       ads7846_irq from irq_thread_fn+0x1c/0x78
>>       irq_thread_fn from irq_thread+0x120/0x228
>>       irq_thread from kthread+0xc8/0xe8
>>       kthread from ret_from_fork+0x14/0x28
>>
>> As a quick fix, switch to a threaded IRQ which provides a stable system=
.
>>
>> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

applied to linux-fbdev git tree.

Helge

