Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7441372DFBC
	for <lists+linux-omap@lfdr.de>; Tue, 13 Jun 2023 12:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240951AbjFMKiX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Jun 2023 06:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239189AbjFMKiW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Jun 2023 06:38:22 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026FA124
        for <linux-omap@vger.kernel.org>; Tue, 13 Jun 2023 03:38:21 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f738f579ceso39962065e9.3
        for <linux-omap@vger.kernel.org>; Tue, 13 Jun 2023 03:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686652699; x=1689244699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cAWffXJhiZCuKdmLvadUWaZhgzR3HLgGd9VEe5lJrAY=;
        b=oWTv+jER8ka1Qe57jA4SaFw0YkAFNR9MLs8EHWTLGK0gdjURb8827U7zjqwpiSvT5T
         e0eaDxvtT7uG5+Wp8EirrXTjTOUQX2j/fLOLaZq/pJ+64Ba00r5H9S/pK7U4dMRJK0L9
         Qc7Or4upS3NpLZcvQbHuxgTi02642jsuq/VHjVcUfbnag6BeSFitZ8VihbqRMQ/amt5S
         6rAO7D1sOS/m+HDxZaf78NEI9Ak53UleVXMM+lSrWWnyEM8j5n0WiG1dLUXPUJpPa+UJ
         39Dun5o3c331GsTFkjQ3ooru5EdNZi10JosHPeRADIMH5vkoBHrH65cHPo29D6Ml/R0w
         z2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652699; x=1689244699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAWffXJhiZCuKdmLvadUWaZhgzR3HLgGd9VEe5lJrAY=;
        b=d2YkU/OA3vs37JzxEQP9FL2nrQsbhIAF5A5d6zJobH6tdAr1eM6xJeSsdrSa5ae6SV
         EaRyYnz/2nCIWaGWdKmbS+18RMJxouzrEjptDEuoZZxQ2BG4sp02Y12lZw3RbxDgX1nl
         D9UjimkGD6nz9jjIuLwBvNQWDwrxvCrVdKyiHKUJdLW6jUD2Hsqfj2OhNpZRblZhWLdt
         5Jgru72piBXaZWOWioowj9UhYAyH0xGpXWdeMzoyaL9V/26+DvkwKKOeHproMvygZDOV
         O7WP2HL4lsGDTqwHOvIbdvtcloqhYYoHsCJnuEJNXloLqW33Cien8uFZInGK1oAEN1KC
         ZxsA==
X-Gm-Message-State: AC+VfDy5yqLauL0JZAeMxtvD9yDxliWQCR10/1gdevdjHg4uZgyUaVcz
        1EIc7OJ20K8lLPjddFguUP8w4Q==
X-Google-Smtp-Source: ACHHUZ7XbWL7BIDfabVlTuRqNRZTwEQFmx5C8dduAKY+peonAhPu4Kc2nONW4msTEVohgZimbq+iHA==
X-Received: by 2002:a1c:ed03:0:b0:3f6:69f:75e0 with SMTP id l3-20020a1ced03000000b003f6069f75e0mr7721992wmh.25.1686652699406;
        Tue, 13 Jun 2023 03:38:19 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id z14-20020a7bc7ce000000b003f50d6ee334sm13982145wmk.47.2023.06.13.03.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 03:38:19 -0700 (PDT)
Date:   Tue, 13 Jun 2023 11:38:17 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        jingoohan1@gmail.com, dan.carpenter@linaro.org,
        michael.j.ruhl@intel.com, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/38] backlight/bd6107: Rename struct
 bd6107_platform_data.fbdev to 'dev'
Message-ID: <20230613103817.GB169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-3-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 12, 2023 at 04:07:40PM +0200, Thomas Zimmermann wrote:
> Rename struct bd6107_platform_data.fbdev to 'dev', as it stores a
> pointer to the Linux platform device; not the fbdev device. Makes
> the code easier to understand.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
