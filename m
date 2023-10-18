Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D09507CD62C
	for <lists+linux-omap@lfdr.de>; Wed, 18 Oct 2023 10:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbjJRIQz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Oct 2023 04:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbjJRIQz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Oct 2023 04:16:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AC4C6
        for <linux-omap@vger.kernel.org>; Wed, 18 Oct 2023 01:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697616967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jmZc6Q4WePRTx40QodA4tT/WlA97DXcd06bFoFktVdU=;
        b=OABB7TV/AMr8RnI7w5pl4uTp+uj24A2yPPM/2No7qNV0cq6iOKTrlNZ9Lnjaq0K8QYCSm3
        T0JjMRijatbaxfz6mh7yTCXSpEtl7rbEZWUkIJ3ihKcY1duAPRP4DLtCEcp55ianQNMYdt
        PRXmsuuOUE+x/VimA7VR8Qcfb7KhtOc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-QwwpU1iKNyW5iPLktWN0pg-1; Wed, 18 Oct 2023 04:16:05 -0400
X-MC-Unique: QwwpU1iKNyW5iPLktWN0pg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5079f6c127cso4293504e87.3
        for <linux-omap@vger.kernel.org>; Wed, 18 Oct 2023 01:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697616964; x=1698221764;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmZc6Q4WePRTx40QodA4tT/WlA97DXcd06bFoFktVdU=;
        b=QFrcP0J1hfntrvFzuLJBGuaOs+VR+YU+y8Q/Rr1QuUFxIPvS0Ty99l9ps8rAwlNhtz
         T/KLHdd4wAekUa9G1+Mkdg21LOwaJtqiVwAZWLuWn6xKhxhaPS1lVxCyKadxUZgsbkH+
         ZTurIlNbADtlN86scvrH9CEksFbDVB8tcUWIcvsFAoV6m9pc0o2ZJAqJoZKN74RQYVCg
         egQ7JXjWdKPQA7Hlk8cdpJcyoksk+xowlKzJBCAVYnxfMvHSvCIKhQ+2KAEXsP3rntSI
         j/OjABvwvB7oXAlSOsa+8hbjwkGqKPpBiHXQg2iZXVPzrJGmR1E5wR56q6URdvQYU8Fr
         lwlw==
X-Gm-Message-State: AOJu0YyVbtpg/3zbBAkg+6C0VPxmGRzJlJJgPgHFQjNQ10q1LikP5C/S
        GZEY2Yck9U2yFyUha0ixLzdCR/ATwhoMb0wTWbzRlB2+DEQxkDCoF/VRGx6++hT6p7DqD7FI+7b
        vFCZ06nywSVfCgq8WNgwibA==
X-Received: by 2002:a05:6512:1589:b0:503:28cb:c087 with SMTP id bp9-20020a056512158900b0050328cbc087mr4387860lfb.29.1697616964197;
        Wed, 18 Oct 2023 01:16:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYatw1+GQZsrovTtK4AIM0GHdCZTQtrZMNluODtTEfilpBoqjDMDouescfpJJZYj44ekzDvA==
X-Received: by 2002:a05:6512:1589:b0:503:28cb:c087 with SMTP id bp9-20020a056512158900b0050328cbc087mr4387842lfb.29.1697616963899;
        Wed, 18 Oct 2023 01:16:03 -0700 (PDT)
Received: from localhost (210.red-80-36-22.staticip.rima-tde.net. [80.36.22.210])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c310e00b0040813e14b49sm988670wmo.30.2023.10.18.01.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 01:16:03 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        sam@ravnborg.org, arnd@arndb.de, daniel@ffwll.ch
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/46] fbdev: Provide I/O-memory helpers as module
In-Reply-To: <20230927074722.6197-2-tzimmermann@suse.de>
References: <20230927074722.6197-1-tzimmermann@suse.de>
 <20230927074722.6197-2-tzimmermann@suse.de>
Date:   Wed, 18 Oct 2023 10:16:02 +0200
Message-ID: <87a5sgqrb1.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hello Thomas,

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Provide helpers for accessing I/O memory in a helper module. The fbdev
> core uses these helpers, so select the module unconditionally for fbdev.
> Drivers will later be able to select the module individually and the
> helpers will become optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

