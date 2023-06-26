Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7B873DF2C
	for <lists+linux-omap@lfdr.de>; Mon, 26 Jun 2023 14:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbjFZM3H (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Jun 2023 08:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjFZM2u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 26 Jun 2023 08:28:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28FE295E
        for <linux-omap@vger.kernel.org>; Mon, 26 Jun 2023 05:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687782436;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Q7A4QtIPQ46OJKI9lflLzm3DTzPmnZrWIQG2/OeQ3hc=;
        b=CT9aDcGG2NmkwgIL6nQ4RA4OYzbXLdghsYiNkAVmHV/Cc+Lz7FsE8ydpXzLv0odMyhGkml
        qXIDugf15+DAjuHFajYWFcP3JtKFNhjqBqpWZxQ0lK3rMn/D69v1Y87mE5hgymX2kYSfQX
        K3Lo07TcI+WWd/FGqF429UwTLvlVQQ8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-NKp1I5l0Nae3C4WVx3BA8g-1; Mon, 26 Jun 2023 08:27:12 -0400
X-MC-Unique: NKp1I5l0Nae3C4WVx3BA8g-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-313f442806dso378981f8f.3
        for <linux-omap@vger.kernel.org>; Mon, 26 Jun 2023 05:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687782431; x=1690374431;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7A4QtIPQ46OJKI9lflLzm3DTzPmnZrWIQG2/OeQ3hc=;
        b=Evcxw21y3hU6Jh0XDZUQwLhFWlTTvAB5aANhrSOjlWtqQm+8LgBkfopEqcugfwCkf+
         Yo8lrmcEtWCrYQ0zr3bFsgf+NMWa+qhv81TZIt0bBGzYcCyJtIUTqlpJtXE8X7cIolq/
         IRxRQ5z1cJZGS6YDqWJwp0V06HTuDqEzZgoHix/LlLiLr+oLXR2B1Q01rx2aKxsWpBky
         tAK1NqIeZC2muQ2B3FjrkkRXnSnDMkF7MdJLYIo0kAt7CxxsbAc9wTKoD2m/3A5v1hmJ
         iKrXtwqayP81V6e62uXp6DxiNI4xvS6xJWdnaphx+9ykdiEtfJaMRcZ/RFrdT+Yt48wE
         GSCg==
X-Gm-Message-State: AC+VfDwDrNljVI74NAHMTo+3zj+4W29CYuUtiJZqLyAz3wgOtPbF6oYv
        IVaP8oLI1QLLo7zREEzJp5Fi/ANOLWjuG/4S8uTmE9QLYC1oSO3SnUch/6/IPA8fMzahwBwugWu
        +I9AcKcc8KO8s7wX+lj6V/A==
X-Received: by 2002:adf:e98b:0:b0:30f:befc:d864 with SMTP id h11-20020adfe98b000000b0030fbefcd864mr25143866wrm.62.1687782431247;
        Mon, 26 Jun 2023 05:27:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5s+xo+3GocfRAN2ddT936OL6TbSjlftKvOe/WQg4sXaYYvHxhA/vC/T+Q/4yNgIvb7WBFVgw==
X-Received: by 2002:adf:e98b:0:b0:30f:befc:d864 with SMTP id h11-20020adfe98b000000b0030fbefcd864mr25143851wrm.62.1687782430944;
        Mon, 26 Jun 2023 05:27:10 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s11-20020a5d69cb000000b00313f07ccca4sm3108010wrw.117.2023.06.26.05.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 05:27:10 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 27/38] fbdev/sh7760fb: Alloc DMA memory from hardware
 device
In-Reply-To: <20230613110953.24176-28-tzimmermann@suse.de>
References: <20230613110953.24176-1-tzimmermann@suse.de>
 <20230613110953.24176-28-tzimmermann@suse.de>
Date:   Mon, 26 Jun 2023 14:27:09 +0200
Message-ID: <87sfaeh0iq.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Pass the hardware device to the DMA helpers dma_alloc_coherent() and
> dma_free_coherent(). The fbdev device that is currently being used is
> a software device and does not provide DMA memory. Also update the
> related dev_*() output statements similarly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

