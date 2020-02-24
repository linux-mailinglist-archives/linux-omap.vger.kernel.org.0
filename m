Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49B0516A440
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 11:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbgBXKsS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 05:48:18 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40174 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbgBXKsS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 05:48:18 -0500
Received: by mail-wm1-f67.google.com with SMTP id t14so8827840wmi.5
        for <linux-omap@vger.kernel.org>; Mon, 24 Feb 2020 02:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DlS9HvBeJ40C/txSt07sCwih0YUG8h5KLHioIGiWog4=;
        b=weB3LAGarjV2WryBzxjWn93uxEzAa6HvBZ+ZsQexkSc2sZnWRUUthgdeTkLri+9MzM
         oZMMrELL7KqxQU9+KOidn+3/LdCnUl3+xL7SFrJN1C+rsX4h1tK13srwP+BtbYuC58ID
         jOpps72H1/OPwudWSxLhRDhzFdJi9bfmBLvvvJwCygP6DHtN6qmihvWHJJX//uD9QptP
         Q4a6NfCee2B+PcGRRFHu9oRAXqLDVF3a0mUcCEfISNh8x0nlR8pKVVKPax6NBT8aObWE
         hXmOTSSYJ4YCWZFQ/ta6uFjkhbygSy1IPMLWipCFgAmmcSC4w+Vl6p53tsYlt9VA6aX1
         NvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=DlS9HvBeJ40C/txSt07sCwih0YUG8h5KLHioIGiWog4=;
        b=g5rFuV9fT5DnTgqDp292nzH99FEpzcQA6iHj+UI1pwc9YwM6F2IaOHfuIIxEUNKO0X
         Pu1/KacrqL2U05a4gHeP806yF3koC6QnTjOg47lLfGmUqrHxvQP5u1X4iWrQzLI9prjW
         +8FCkw0SNXTh+Nj6l4lpHMNeO1kLGyZ8Bhga+H4TinZ+8nQapPAQlGe2vmHb0mdSkGfp
         RceGIyLe8GAYyWrHxoet4PHorpXAMqCkYAXqbF6BG6GkjlxkKVYpSA/MDAZTHq/rmcqv
         AkSOv8uHHVvnvukhWCIV4Cp/ZN/2ni0zog0Nl0idErx0JX/bsEvxSX2mIbIN29Rm1TOD
         2MnA==
X-Gm-Message-State: APjAAAWEO0ZQ2OFDUjnAcY/cJ/eyiKcUnZ9wvbdBv5ptJidvizfsglvJ
        EPt8WrIOcauG1IM1DBNgRcl9ZQ==
X-Google-Smtp-Source: APXvYqysLZLszWQRkkFDtdkz0vqL9kByB/8xkSBa91ZWllcVHRPpcTzSJsPfX0RQyNQTE4qG0xBX9g==
X-Received: by 2002:a1c:3d46:: with SMTP id k67mr22204894wma.171.1582541295301;
        Mon, 24 Feb 2020 02:48:15 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id i204sm17574955wma.44.2020.02.24.02.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 02:48:14 -0800 (PST)
Date:   Mon, 24 Feb 2020 10:48:45 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: omap-usb-tll: Replace zero-length array with
 flexible-array member
Message-ID: <20200224104845.GP3494@dell>
References: <20200212235642.GA19206@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200212235642.GA19206@embeddedor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 12 Feb 2020, Gustavo A. R. Silva wrote:

> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/mfd/omap-usb-tll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
