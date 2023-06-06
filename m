Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1BB7236D0
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jun 2023 07:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbjFFF2h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Jun 2023 01:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbjFFF2g (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Jun 2023 01:28:36 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E495C1A7
        for <linux-omap@vger.kernel.org>; Mon,  5 Jun 2023 22:28:34 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f736e0c9b1so25210515e9.3
        for <linux-omap@vger.kernel.org>; Mon, 05 Jun 2023 22:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686029313; x=1688621313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJOXSF88DjPrnCYvhp794YSBiOIag1Qb+70cCdfwYxU=;
        b=kPBHfTSe+3iTgyI53dScjnFVlv+5aI5Dq2IL68wZAwPflgnKzBa09ymP0f7PGhDCZX
         CrqY3Jlrpz2aX1JIXn/3FX+D/nRO2hcfOZI6PaMbbOlNIMoNvzO305kQaMJaAWjpH7Gx
         PWfaDq871RrRGMSrPWtOSI5GOstsH9UNXUegz2AVPdcc0DYDa7SVK0V2LhLq1rCL5/Rj
         CMEm+84URhyrfyZ4zlxBlxDZxstC+d5zEMsTVICDBCOK/OToigswOLCtsiFJoA3NjumT
         iPH6Uo0dSBFMa9CA0dMPHfyM9TtnsdladS07MzE+lJnRjEP1u6Mzt6XLhlioBaAXsvtO
         wCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686029313; x=1688621313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJOXSF88DjPrnCYvhp794YSBiOIag1Qb+70cCdfwYxU=;
        b=iAUKrT2BL5avQETbrZa1Tj/+XKQ8sC5Y1OQ9drpPMW/gPlgiKw2SWbkfEW2nYgjs+o
         u1Wx6IfOFDlrBRn2z0uPnLlaR94dBGHVfkRdGcH8UsnWUueQL/3/VhDrKA1KyU3h/frW
         ZTYnIN2xOGYk+1X9qAySs95JWCUNhuC+wIoB3M6sxJy0SvaGbVS8ToHThNJ+FH+Sr8C6
         5sU9UhCgxmBqYrkNkmo0Ha6hITvxNXvWpy4kDTASfue+32ngfxWE/Rr2TRP+LP2xh+SE
         ht3oNjyXVwVp5fow3oVKIiaOFSHrWhnx7DdAu6KJlS+hLuzgWVhNbpKwywF1lB899ZvY
         qYpQ==
X-Gm-Message-State: AC+VfDwFyKLcLRC5+hMv3U55XKJXZ/8XoNGUNLtD9YKIhPDb2n1RpP/U
        jEdEJ5Ozll2I4TVdqwAbiAANqA==
X-Google-Smtp-Source: ACHHUZ53mQ64foMYdD4WiJ9aXcXW/Mh9UVrYMszuUl5utsyKjRZqTF91fgc6UpYXQ5nOqZPoVHtjhQ==
X-Received: by 2002:a1c:770d:0:b0:3f4:2770:f7e9 with SMTP id t13-20020a1c770d000000b003f42770f7e9mr976047wmi.17.1686029313452;
        Mon, 05 Jun 2023 22:28:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f4-20020a7bc8c4000000b003f7e717c770sm3198157wml.23.2023.06.05.22.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 22:28:31 -0700 (PDT)
Date:   Tue, 6 Jun 2023 08:28:28 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 18/30] fbdev/radeonfb: Use hardware device as backlight
 parent
Message-ID: <f1bb576e-88cb-4c5d-a7a6-d45ffc48edb3@kadam.mountain>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-19-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-19-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 05, 2023 at 04:48:00PM +0200, Thomas Zimmermann wrote:
> Use the hardware device in struct fb_info.device as parent of the
> backlight device. Aligns the driver with the rest of the codebase
> and prepares fbdev for making struct fb_info.dev optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Benjamin Herrenschmidt <benh@kernel.crashing.org>

You left out the Cc:

regards,
dan carpenter

