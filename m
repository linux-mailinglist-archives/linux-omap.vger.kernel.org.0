Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236447259BC
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 11:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239870AbjFGJMS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 05:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239868AbjFGJLi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 05:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B95B26AA
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 02:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686128998;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RSdIsVX6ecFqz04GkrugK7lp/x5jJUtqPYllPP5sQjg=;
        b=SVsN5vU9K8FT/r1Ft2radZh+CWKDa0llXTI0Q+7QyXNmTqBx4yHVeN2g+zUFavw0nGHeXX
        Vtee6T+qxMA24BX4/4PbrIxgBZLC+Zz2RNnai8L2fp7HZz+51EKcMHHG27j9xupm5JOYU7
        GT9Kpv1Tjd09iWj/LoJzfOYHJ5zvo4g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-rkddc9L9M9iwdVLfHeJovQ-1; Wed, 07 Jun 2023 05:09:57 -0400
X-MC-Unique: rkddc9L9M9iwdVLfHeJovQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f73283f6c7so1811095e9.1
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 02:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128996; x=1688720996;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RSdIsVX6ecFqz04GkrugK7lp/x5jJUtqPYllPP5sQjg=;
        b=kWBTndQAKAJjta9qwcGvvFhqJQEJCAOu83aT2ZDWAT+5mE+3PCfJkMgN/+US3uACln
         A0tWupa1b+lI97G2naOxnKFGdImyjKK7OdZ7iYKefvQPAIrqvWVb4YvW01Vv1iih2bl5
         cpSO5YT3QRlRDiFMD2GuG95yKLk7GwafNcS8WdRPlTsTRglupJxxT5eudQLrE+wQsNoe
         dw/el1c3WvMcsM7J9oPO90kZiimUszsEuA3k2wMMI/XN3x59eJARF51kvRzLKx/o5fXK
         O+puteQ/ZA1CK85bX3pnagDU/qfI0cwNHTZRtHe7O1Hvu8bcIL2jxdTRBLMCl4OuiIXt
         JErA==
X-Gm-Message-State: AC+VfDw5S2yZ09GzYBmmE+2Bg8dpVYqd77lEAEoJoslQtHFzaNrRUIA4
        e5a03/RRPb8i2okgbhcv0JsZA0/wgCoOB3G2g5fbiMXm3x14zpZbG4IhBMFZzBz1StIA8TH5Xi7
        pwkIDDZn1igp9pILmLfnvuA==
X-Received: by 2002:a05:600c:220f:b0:3f7:395d:6585 with SMTP id z15-20020a05600c220f00b003f7395d6585mr7850349wml.15.1686128996489;
        Wed, 07 Jun 2023 02:09:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4S4Ug1fiHJ0oCExHc5SSiTGb/dJv10TIcn7zVRyFtmlI7TI/i0oDDpnO/bY0dqK+vi3g6l4w==
X-Received: by 2002:a05:600c:220f:b0:3f7:395d:6585 with SMTP id z15-20020a05600c220f00b003f7395d6585mr7850336wml.15.1686128996200;
        Wed, 07 Jun 2023 02:09:56 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v25-20020a1cf719000000b003f736735424sm1425404wmh.43.2023.06.07.02.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:09:55 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 17/30] fbdev/radeonfb: Reorder backlight and framebuffer
 cleanup
In-Reply-To: <20230605144812.15241-18-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-18-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 11:09:55 +0200
Message-ID: <87zg5beizg.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The driver's backlight code requires the framebuffer to be
> registered. Therefore reorder the cleanup calls for both data
> structures. The init calls are already in the correct order.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

