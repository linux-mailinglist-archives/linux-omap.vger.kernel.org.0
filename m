Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5608F730B
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2019 12:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfKKL1A (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 06:27:00 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45162 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfKKL1A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Nov 2019 06:27:00 -0500
Received: by mail-wr1-f67.google.com with SMTP id z10so8895226wrs.12
        for <linux-omap@vger.kernel.org>; Mon, 11 Nov 2019 03:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Pa4yLrRRJrTvDCTKV7j9zkWSjluubOWsot5AwNZziFk=;
        b=MMzQCpygtMnyYjiQIFS+/BfIy0BdjWDImAQ8uUehCobiZwfMMM0Y+wSeT7qoOlF5Bf
         A/aIQFgmyPZDM8OWE51brXONTY9KdXqm84kdWxo++lnT33J+AUZL7csqcWNXbHI9q1yW
         EJRrjNaKGqQKfRd/GQPIN0DHabkvGe9nmuCt7XyVUEt5IMtZwzfBDMAGSPXUAfeh6gf2
         p3suvBT3NtWXcCji0jyTgWSS2YHUgTdAWofZsHzH8HFLuDarkeL6GoU/yQiPNEa3OSII
         BdXnPt4UmMssmm30vn1PQClWHkavnKbrlU02B7bMRrtR4rryc0HLwOsUnuQz1Idql8DJ
         NWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Pa4yLrRRJrTvDCTKV7j9zkWSjluubOWsot5AwNZziFk=;
        b=PpYl1TvhKTzG7+Y5+XJZUsbnYjjYbQqOOTIhBFTy1G4mLxpyt0/cMeYLAUOWBbvR97
         ptckInk5ogvcs2ktSEpQCNxGc42/pAZMWa2NXKXLDt7zX7Ad8Fm1VqGqstAKR3lSn4FI
         Uzn3JHD4duSPwv4IK1mm1ymQny8x3RFOts41Kz/t11s7HrQA3YdM32WjHKt/Mf+pVFab
         LpDBbbCUObOpmmLsm3daoDTzPNBwTS0EjaIJMBmYJ5VuJXJLinIsDHk0szfX5YF+dJro
         rIoYQ0h0lO6kFg5IIiRyJdAq56RWBFhCd/lkIlf9LT5LfDkpwpLYemxH21w3LsFqAd4G
         PGaA==
X-Gm-Message-State: APjAAAWUy3yCQ71vD5okK0khVksdpnNusdRm5Y7xgLsjzwCfBRdVdylO
        bGdBs8dC0E28Cbjpl63nYCIEPUGseZs=
X-Google-Smtp-Source: APXvYqzU0tWl6tXFwZxpKX/HcCH9W/vDJ+gkXXF3qBjaQgCFCI9igBdHVWfJ4FDKbmiBVNRCezMEow==
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr13048781wro.305.1573471618209;
        Mon, 11 Nov 2019 03:26:58 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id b3sm17597864wmh.17.2019.11.11.03.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 03:26:57 -0800 (PST)
Date:   Mon, 11 Nov 2019 11:26:50 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] mfd: ti_am335x_tscadc: Fix static checker warning
Message-ID: <20191111112650.GJ3218@dell>
References: <20191109050618.20637-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191109050618.20637-1-vigneshr@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 09 Nov 2019, Vignesh Raghavendra wrote:

> It is possible that platform_get_resource() might return NULL and
> therefore code needs to check for this condition before
> de-referencing the pointer.
> Therefore move the de-referencing of 'res' pointer after
> devm_ioremap_resource() which would have checked the validity of the
> pointer
> 
> Reported-by: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/mfd/ti_am335x_tscadc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
