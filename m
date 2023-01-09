Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D515F6623BC
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jan 2023 12:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237051AbjAILDH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Jan 2023 06:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236845AbjAILDG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Jan 2023 06:03:06 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA36120B4
        for <linux-omap@vger.kernel.org>; Mon,  9 Jan 2023 03:03:04 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id co23so7750164wrb.4
        for <linux-omap@vger.kernel.org>; Mon, 09 Jan 2023 03:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zefo0+cIWrVM5FFfr0NEPPr+QlP+S4JK9M0A8dYdzso=;
        b=oGr26Y/fiwHYFqrJohN/Z+dunayrmT0xuC0ParAo9r2mbdlha7JmZ5TehQNI7/mIWp
         hWSaPL393d7ahA2QrXLa47EcjFnu5YT3Jb1N9fthnTAQrjCxXX5POnD6hWqlfRrvA5rI
         D/zve+wX42+oAgMs/sBQZoe1LdpaOjZRMLxj9/pt72r0tOe0R/+AjRzibKCDbZ/OAUkz
         Q0BxMJI//BsazsVVwnI2dgwGh987r5dh+ydGEkKrBjeM7d2rKYJ1AA6ZN5E5Avw5UebQ
         EnTIpNqs1kyVGp6yaaqvQXZQzoIn0NGA/pp6hh/yoW71e/0duhXVOBRms7rLUxGdJdLd
         s8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zefo0+cIWrVM5FFfr0NEPPr+QlP+S4JK9M0A8dYdzso=;
        b=agDyD427w7S0Cz+3zEh74kd2vgQThMCe5BZoafB/qL7f/YJuVdhmKQjnJqhekc92di
         aFrNpxNMgUmSavH6Ne1kdcImFq5lwwOrQmfagH0G4dIhL2J/8gVfkd5nFgjtxMk8Y7RJ
         e6/9FLztUCyoM3TJ7s8gjFHaStVcVGeQK/EfgGyhzLkyGBA0PGktEEUUVUYGoJglo1m5
         HSG8t1eR9uVp2HtTqVXd+WD/Y2KoywtrkWuvOpgQMIUNe+wVpI0XZSAWIY8G2xN5aGkM
         9xKSuU/MZNg9vgJtZ6t0ocG6U5sw7KrREaVl1p44QMDT+L7aCE+sQXZ/DwxwYY7noOvO
         xBgA==
X-Gm-Message-State: AFqh2kqQu7+iQl0VzCnzLmYF9jcfEI8M+oia/eyflzw5FX6oNVeG/gh7
        sKbygfbBBH2Kt/B0vLI69ZXTbw==
X-Google-Smtp-Source: AMrXdXuJ229PsMqnsutJQhmCnDx582UTxhRGjYEWDOJCs8UDfbNlBoANEOulxPZfAp5vzNYgBBmlzA==
X-Received: by 2002:a5d:56cb:0:b0:28d:66c4:3102 with SMTP id m11-20020a5d56cb000000b0028d66c43102mr23679733wrw.12.1673262182985;
        Mon, 09 Jan 2023 03:03:02 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d58ce000000b002879c013b8asm8250053wrf.42.2023.01.09.03.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:03:02 -0800 (PST)
Date:   Mon, 9 Jan 2023 11:02:59 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     sam@ravnborg.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Helge Deller <deller@gmx.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Antonino Daplas <adaplas@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>, Lee Jones <lee@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 13/15] backlight: omap1: Use backlight helpers
Message-ID: <Y7v0Yw3kg9E8j5Bu@aspen.lan>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-13-1bd9bafb351f@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-13-1bd9bafb351f@ravnborg.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Jan 07, 2023 at 07:26:27PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
>
> Rework backlight handling to avoid access to the deprecated
> backlight_properties.fb_blank member.
>
> The rework includes removal of get_brightness() operation,
> because there was no read back from HW so no use for it.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

This rework will result in additional calls to omapbl_send_enable()
during updates so, if anyone who cares about omap1, is filtering LKML
then a Tested-by: would be nice.

However, I doubt the additional calls will do any harm so even with
that absent:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
