Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 725FE33047
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jun 2019 14:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbfFCMwL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Jun 2019 08:52:11 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43697 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727248AbfFCMwL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Jun 2019 08:52:11 -0400
Received: by mail-wr1-f67.google.com with SMTP id r18so2927208wrm.10
        for <linux-omap@vger.kernel.org>; Mon, 03 Jun 2019 05:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wq4yXJBlhuJZxMm1hF9bS2M5hccH7sIFbHfwg9bPyr8=;
        b=u0FiRAG1N1Uc7hXsujUHXgiHeLFDEduvv2RaP9IH4uBuwimI4HmDFnwWTCj/YuqzlN
         GHtC4OSLAXSoEGZgkYrBiCnnjYAKdsQrWDtYs70f+dbavzGxEnWcuxe2ScUjnutYWmvo
         gzD56w7XjOfdy/bHa3vFc9EzoVt0VT5wuf+1hIyrpuT2FHQHWHjZ9Bm+Bp6Unu/7mqxU
         9G+YzbZmQCJm07mZ24PQbLpTNBU6ijYualwFvtX6LIdd1lsxYKIamM4UrdxzzT5kFulT
         itq42B17nQ5vpo/TxNUMY36cNp3NsCWrx90hg7OleUfxzpTp5ofnjUaZuFERuMLbV+wg
         NdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wq4yXJBlhuJZxMm1hF9bS2M5hccH7sIFbHfwg9bPyr8=;
        b=DoB5N+k30cogPv6DE+VXwHvI+5RGW9+STJreZtWYhjJbwGCpd10xb2YN2K7rV0dFBC
         POYlGaBwi7/V/Tbq2Fm2I2PempdWJASVfJwbBE7pmpndkK6taLIk8uOAfKp1sSwCpyKH
         u76EGUOg01kQghULAeyzhF4ItegxdIBSSRDposnDfqTiwDqjGU8xF04Lam/D3TqeHDYO
         u19Pm08k6Yca/uv+DonlNbTNyVhUHsGYQUTBV3xGiyUNhvPlMIOhZIiM5GEp+F2HHHly
         2mHi8wG1jgWLmoADSi9lluD21/7B7hUSDMgJf/NLM/ovgbq+J/hPrEco5NJ5y/vZaOFO
         0XcQ==
X-Gm-Message-State: APjAAAVgNMtHY6b+2yjCrZZU8xzunagJB3Z+WVr6ifG7fsh4qA61qnTM
        5ivjn7ZzPe1+XuyPfOxcxpt3qg==
X-Google-Smtp-Source: APXvYqyHqS828di86eR4vgH2o4EKGJYQNKkueq2r86n9Zcm0f3WrLAXn3vXIJ40ZJjMdjHZWGSyg0g==
X-Received: by 2002:adf:eb45:: with SMTP id u5mr2393533wrn.38.1559566329776;
        Mon, 03 Jun 2019 05:52:09 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id o3sm11745269wrv.94.2019.06.03.05.52.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2019 05:52:09 -0700 (PDT)
Date:   Mon, 3 Jun 2019 13:52:07 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: menelaus: Remove superfluous error message
Message-ID: <20190603125207.GT4797@dell>
References: <20190521204304.21295-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190521204304.21295-1-alexandre.belloni@bootlin.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 21 May 2019, Alexandre Belloni wrote:

> The RTC core already has error messages in case of failure, there is no
> need to have another message in the driver.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/mfd/menelaus.c | 2 --
>  1 file changed, 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
