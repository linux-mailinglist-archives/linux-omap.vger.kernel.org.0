Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F0765CC68
	for <lists+linux-omap@lfdr.de>; Wed,  4 Jan 2023 05:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238506AbjADEiZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Jan 2023 23:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238581AbjADEiW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Jan 2023 23:38:22 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD0413D27;
        Tue,  3 Jan 2023 20:38:17 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so25602863wms.4;
        Tue, 03 Jan 2023 20:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OXCiZDi2+Assy8TyLoUyrmIVdMgcXdRyVjJ9cIBOPR4=;
        b=CR8cvdUBgKIaLWQvsuJVPGdFHjACjWpQnVgw+nvPiTsRyiM1M/5HoaOyHoH0Hpkwns
         CvAT4wyShSBlbRKxGNUdhMUoVgSKwysCiikpjX+0bQ7Q2+jC5pPMzD2sYl2rYOMw4EIF
         gqd6xW4I2yHtNpWi0Wnmt2lqcEtpMCfurRYjtI5oO17VdIULKiuM3Ipvyu0Y/qR6CQG3
         2dG5i8MrBhlsUyTgSygo53O3wzMgTRFcgtHSGo07lCVkQsY+J6U4N3CMA3vZKeWGiSCV
         37bTluAv4JvwEZ54F3iUnLZ5PSP934YXpPmFvI+65v4PALrwPml1zAPuTrDbHo72cUnj
         cyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXCiZDi2+Assy8TyLoUyrmIVdMgcXdRyVjJ9cIBOPR4=;
        b=dLI6zdbTIYTTxtWpGCFam9Q8xD6/EIX+5bWls3xLBFsokiaxfRmcl1sbT4DoTWwJnH
         tl/hNdPfXU0AzTuepDpsF91GMRHkguFuZTtLaIxlWLXIx/c7+EngH/sDIF+yVvts2WkP
         3ZB89POuO8vEVf3nBxltw6jA6mot51n+Z1uNYjqSq9/11Q9xAbGNBqzpgQ7TQUnairLj
         JK9x50SwHorWttj4bE+6uIJJihMLnsJHxriAxuR87rjVacFt8dM7jnVoUIljENmxMhqi
         hklOFtM4TIKI/YOoJR5R+dN204VlMLcKwe8R4nCr0dJ9cmyv87yLXjfeB4cdL9BA0cQq
         CY6A==
X-Gm-Message-State: AFqh2krb2KcvS88GTywsU8uU6wZ1vCWvi/x7sMRmBUoYJ/XJHuuR46OU
        xX0jpAoOgR4O7dRv+foler6CIOZsDPiGchE/
X-Google-Smtp-Source: AMrXdXshAF02SVtvI0gbrJ8d/iQjU4KzkZy5rOnJ56mFSRDY4s7tKIcsIE3Br+8evxwRRsrRQCUDJQ==
X-Received: by 2002:a05:600c:1f12:b0:3cf:a851:d2f2 with SMTP id bd18-20020a05600c1f1200b003cfa851d2f2mr32875474wmb.21.1672807096372;
        Tue, 03 Jan 2023 20:38:16 -0800 (PST)
Received: from tp440p.steeds.sam ([2602:fbf6:10:8::2])
        by smtp.gmail.com with ESMTPSA id bg24-20020a05600c3c9800b003cfa3a12660sm506881wmb.1.2023.01.03.20.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 20:38:16 -0800 (PST)
Date:   Wed, 4 Jan 2023 06:38:03 +0200
From:   Sicelo <absicsz@gmail.com>
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        rogerq@kernel.org, tony@atomide.com
Subject: Re: gpmc wait pin regression from 89aed3cd5cb9
Message-ID: <Y7UCq+umIJScfQ16@tp440p.steeds.sam>
References: <Y7SoIxhkOiCS+BFj@colin-ia-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7SoIxhkOiCS+BFj@colin-ia-desktop>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Colin

On Tue, Jan 03, 2023 at 02:11:47PM -0800, Colin Foster wrote:
> 
> After commit 89aed3cd5cb9 ("memory: omap-gpmc: wait pin additions") the
> SMSC stops working because existing device trees don't have a default
> "gpmc,wait-pin" defined.
> 
> I fixed the issue for myself by adding this to my .dtsi, but I imagine
> any existing device trees that use the OMAP / SMSC combination will be
> similarly broken in 6.2-rc2.
> 
> My latest DT submission shows the use of the omap-gpmc-smsc9221.dtsi
> without the addition of gpmc,wait-pin which worked in 6.1:

I also had the same issue in 6.2-rc2. However, I found the problem has
already been fixed at:

https://lore.kernel.org/linux-omap/20221209123147.591982-1-benedikt.niedermayr@siemens.com/

Hope this helps you

Sicelo
