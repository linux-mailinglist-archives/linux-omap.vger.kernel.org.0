Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5FA7259CC
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 11:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239540AbjFGJNh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 05:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239614AbjFGJNF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 05:13:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13998212B
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 02:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686129076;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mH0V+GQH9u3hTOintFl8kIUIu94Srk8ZL012Xjzg5pc=;
        b=hy1ts/e4vaL+GxeT4gl0KEkJq7sahjb/dEt7ryFgn/ffoGA4kvnzuwuU4JgUUC/JSNX/EP
        dkCw/sb4bNsf6vLm2W2On/zCHHILQFmyecybdbNKOiqcRV4mqRP70YFpRyEsP3NhLDRQcX
        VHOAzHFmifNs9chifU16fPEWcSG0gIA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-W5rtrJZWOueEo6dvpPR6QQ-1; Wed, 07 Jun 2023 05:11:15 -0400
X-MC-Unique: W5rtrJZWOueEo6dvpPR6QQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30c5d31b567so2534917f8f.2
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 02:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686129074; x=1688721074;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mH0V+GQH9u3hTOintFl8kIUIu94Srk8ZL012Xjzg5pc=;
        b=DR62SyCk26GqNEcAlyvg+9dLd6Fts/CRhnujBk+kQNKIHXNnZU3p0SQ7QMOEpdhEjS
         dHYF+rBTQh6di9NFOhxhp4J3HV+z0EBa+zXnzW6AOmXBMivExRf6yrfdc7lI+cNn2f0T
         76jk752C/FJEEeOsUFBDZtghTkn6jptQmgKpCOiptrHTDLCFeS2k6vzj2ixuy9pYP1Cu
         aOuyd7rgDfUPlV6b6O16pqKM3LxZdVJgtLmiPsUiO05H8smuxKZyzrRqCGhdZzDrclAW
         gu3QU4BpGbxjRIY9OO125d5aKH08h+TRDT+LEfv7AN8LISIPMg4O08Xqcyqv/6+5ksbP
         Arkw==
X-Gm-Message-State: AC+VfDwz7asbI7pmP6GVy6j5unCMbX5PvkJkcJ1pn9L1YGhH5xG6oITg
        fm8nIPLyQT8ZfHYMPjp0KRbvpdLhQzq8ERix7S7+5eYnQZmCF5V2Jdw7QRV8EL+sanRro5LGklW
        5MLz3hKWEjVGqBYX7As1tGA==
X-Received: by 2002:adf:e688:0:b0:30e:32b4:88b1 with SMTP id r8-20020adfe688000000b0030e32b488b1mr3941822wrm.9.1686129074280;
        Wed, 07 Jun 2023 02:11:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4KJfeyDxYfcACaVW0UaN5JNsg10BzGoz+FuMEljUH8CXhTXkm2kLiaHaEUmQ35VeCWg/34qw==
X-Received: by 2002:adf:e688:0:b0:30e:32b4:88b1 with SMTP id r8-20020adfe688000000b0030e32b488b1mr3941796wrm.9.1686129073975;
        Wed, 07 Jun 2023 02:11:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k1-20020a05600c0b4100b003f735ba7736sm1412543wmr.46.2023.06.07.02.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:11:13 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
        linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 19/30] fbdev/rivafb: Reorder backlight and framebuffer
 init/cleanup
In-Reply-To: <20230605144812.15241-20-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-20-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 11:11:12 +0200
Message-ID: <87ttvjeixb.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The driver's backlight code requires the framebuffer to be
> registered. Therefore reorder the init and cleanup calls for
> both data structures.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Antonino Daplas <adaplas@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

