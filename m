Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E134240C042
	for <lists+linux-omap@lfdr.de>; Wed, 15 Sep 2021 09:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236486AbhIOHNu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Sep 2021 03:13:50 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:43734
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231317AbhIOHNu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Sep 2021 03:13:50 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5A40F40285
        for <linux-omap@vger.kernel.org>; Wed, 15 Sep 2021 07:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631689951;
        bh=191SUmgkCeF6ZQfCKm5T3c+lIG15mkBcbqwnFyOCstI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=KkDhMzcW8X8369iUkGo5nfyP5Tn/MGOOdkiPhJZ/k9+t+9rJZKuM9a+8QdP2Yj3Cn
         qJjEuHMNsnbrQ/BqIrpAmiNNmcfesF0pC3IsK+7MZxC6w8weRuYGmYqEUUUwmW7hsS
         SsodyRCz0rMeLxJOguGQroS/nCd4oX6do/gMZzZRffQ1FJKgXdtCfBOVvu8thiemlH
         e+qky4n+rapJ4iRgk7UUKyBX1KwWkJrnBslYlX3DCA9EyLer2sjzIUW0k5qb7iG3Mt
         UnGkOqCEVdYPeIrwMorEz8YRl8UmEE6K8N3TLhkfyOOww+CGmfIFTj7TOXnOW79BN3
         b/iEpnda+7Maw==
Received: by mail-ed1-f69.google.com with SMTP id r11-20020aa7cfcb000000b003d4fbd652b9so1039137edy.14
        for <linux-omap@vger.kernel.org>; Wed, 15 Sep 2021 00:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=191SUmgkCeF6ZQfCKm5T3c+lIG15mkBcbqwnFyOCstI=;
        b=QnS85WO4PHugHtR6UUrTOJddcqljGuJcIn+eTudFf+Yd661TZQHORAYYiDnKL9VHUf
         0hq/JSa9Ii8jQJ5ElP9YUV9eum6yCoAZbO1xAq2VylL8YaTaFoQLw6Psa6mIbVlZKoFw
         Z/0nglo7SYKuQCrzypf/aI3f4vk9aNN5mi2er9GeMGvRmx+9qtaemmg0HW/G7tjYEwZn
         VCyfb/vXAaBgJkaQ4eEgv72bRiSgK9Lnat9MjHCjVwCqJEVgT+FVGnS0uml7Y3fVxKQT
         6pZ+1omQORzyOuPqtE2beGGiheSHPm9bvSKQ3IC9TCNepGRnQDruRrZp79GASPTG2Sn/
         NxHQ==
X-Gm-Message-State: AOAM5334HpT74vjXaF10CPUCZufaJAV7cuwfJYydb17Ie639uNcUh416
        HuxPyLRL+NYM+8M6GKmas+ri71yy0iannOOjLosOa6YK/1qANd/imglg3JmGSIIV52PPoqS4gtB
        egqUnGuw5o7eI+/H3F0c/RaFyoQSxnB/XUs0FL/Q=
X-Received: by 2002:a17:907:1df1:: with SMTP id og49mr23623915ejc.35.1631689950885;
        Wed, 15 Sep 2021 00:12:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5UTlhBkXQsaIUzYd+PTbm7+gO6+qavmcR/SDNB3M32OjLvLJ+G9bwfmFaihvVDi3NUULxjA==
X-Received: by 2002:a17:907:1df1:: with SMTP id og49mr23623889ejc.35.1631689950598;
        Wed, 15 Sep 2021 00:12:30 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id p23sm6916478edw.94.2021.09.15.00.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 00:12:29 -0700 (PDT)
Subject: Re: [PATCH v4 8/8] memory: gpmc-omap: "gpmc,device-width" DT property
 is optional
To:     Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-9-rogerq@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e0c4759b-7c2d-e32c-f912-8409c1f65b49@canonical.com>
Date:   Wed, 15 Sep 2021 09:12:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914122705.15421-9-rogerq@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 14/09/2021 14:27, Roger Quadros wrote:
> Check for valid gpmc,device-width, nand-bus-width and bank-width
> at one place. Default to 8-bit width if none present.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/memory/omap-gpmc.c | 41 ++++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 15 deletions(-)
> 

All the comments from v3 are still applicable because it seems you
ignored them. Please respond to them.

It's the second patch where the reviewer's comments got lost, so it
creates rather poor impression.


Best regards,
Krzysztof
