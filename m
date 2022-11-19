Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03CB7630BBF
	for <lists+linux-omap@lfdr.de>; Sat, 19 Nov 2022 05:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbiKSEKu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 23:10:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232698AbiKSEKU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 23:10:20 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092E5922F1
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 20:10:00 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id l11so9677097edb.4
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 20:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jS1rEy+CuWJbjfkMiWRzHtjN1of3jyH33cEAD9vZXv4=;
        b=i2vJaJN56vTDP8l/7n/DnPMTIRYgL58gu8RDl8CXlXXtvy4KVQkvYMBUosF+4Rynfb
         ckFbpTAN7diczGGJy3wGkm4gCryvnPh2JIHH4HL40bGE2OwGupydAPhcJTIXfg9mDRgs
         lvyvrvd68sWeC7zzYCQB3mjKhmKk20d0t0SG5JOAbhqfmq7bVSwbVSwlvMCyu0wwScHe
         CPdnu+Yxus+aPw/WvvN4TuiUZlkVJAMykjdzwtSdSzI2t9scY70RMG6Z9l9lIHSz6Aja
         DFIvrxQiRRzQaGGwv7sb4wj+I96x9sGBhiAHgVMe+wJ7BhK5F5vDkkjMz1/lVt/FORBm
         6ZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jS1rEy+CuWJbjfkMiWRzHtjN1of3jyH33cEAD9vZXv4=;
        b=fwQe7CUwTISwXOs1ROs+NV/YtUZDNe+lJMs8oYhnkDEs7XHYlIl7uUGcz+Zg3zypye
         es/zXwdghhACQarWNiJkppVeh3SCVknP8ez9JRGvVk4iJBLdKV34itnUs/MVQ4bK+F4v
         v1jruWmVVvRCTH/xbGvRp1CSTTnTBUfA3SeF3q23Tm/RI4KT4ux+vP0NRQ3xsfy8+pvl
         q9cvU34QLHGJsDOf1sDREAvcVambNxZhLNphA72aEEWybR6fOGB8asGPh5AvNn8kOBCC
         bZY6nf747COzj3D7IWeGOFxD5Cx2RMXblQdYkimROay6KnyUcQ4r1sNWOYpupab5m6d3
         wYvA==
X-Gm-Message-State: ANoB5pnhhZOWqP6emis65lKS+QLnGwrf/dcqLZTZaU14KsTqniur5rck
        hFSF1pkNdjTGQ27ZPkkD3os=
X-Google-Smtp-Source: AA0mqf7cnM0NDNSnmrA0nPuPCXYfmZFK//nHEglXy7OVVaEOt4Tea0BWyjLDtSJHnN/Muf+fsSQKrg==
X-Received: by 2002:a05:6402:1045:b0:461:68e1:ced5 with SMTP id e5-20020a056402104500b0046168e1ced5mr8858690edu.142.1668830998484;
        Fri, 18 Nov 2022 20:09:58 -0800 (PST)
Received: from tp440p.steeds.sam ([69.63.75.250])
        by smtp.gmail.com with ESMTPSA id ky11-20020a170907778b00b007803083a36asm2425818ejc.115.2022.11.18.20.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 20:09:57 -0800 (PST)
Date:   Sat, 19 Nov 2022 06:09:53 +0200
From:   Sicelo <absicsz@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 1/3] bus: ti-sysc: Add otg quirk flags for omap3 musb
Message-ID: <Y3hXEdK48pWErZpg@tp440p.steeds.sam>
References: <20221118104226.46223-1-tony@atomide.com>
 <20221118104226.46223-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118104226.46223-2-tony@atomide.com>
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Nov 18, 2022 at 12:42:24PM +0200, Tony Lindgren wrote:
> To prepare for probing omap3 musb with ti-sysc, these quirk flags are
> needed similar to what we have for omap4.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Sicelo Mhlongo <absicsz@gmail.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Works fine for me on Nokia N900 (omap 3430).

Tested-by: Sicelo A. Mhlongo <absicsz@gmail.com>
