Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 289FADF784
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 23:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730310AbfJUVlG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 17:41:06 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:45873 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729388AbfJUVlF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Oct 2019 17:41:05 -0400
Received: by mail-io1-f65.google.com with SMTP id c25so17776713iot.12;
        Mon, 21 Oct 2019 14:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XU7mKCCl67wX6wKCXpYaHrBkNqaUXbTtN4O3MSvFFZc=;
        b=lmgKdMSOAM+bakzk/z5MJW384F6nz6yEzpp37fhndMGa54ySe3wiW/MiUDnWHhZBFf
         F9ul3znyVUrKLaRQgKXsVqhsgxyPpIWVqdVL4O45BP1k4NcI6OcN7/hh8o/+U2kDy+D0
         VOiqw9now5+oUNAlvOiFiJltQ0tCA5omJ5wWtYJ2l6qf0/6ntWb14QCbrp4NUa6gI+pu
         QGPPZ5oAUu6MIoNlBIwaZigxfy1e/xwMD0N68Cmize4rHludZec8Fdn3bEUHPX8DCTWP
         3o1oUDq+PajR8SVd2sCJualvqxQSIvF8BJ0kQ4g6IoJsGMyFgO/Bsfk3znF9cb+mMeAm
         /Zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XU7mKCCl67wX6wKCXpYaHrBkNqaUXbTtN4O3MSvFFZc=;
        b=jvoyXVKm6ticztqQIh2SfiguETlmpVsNCfuejYNQ5+IAdEux9n/GfxjBR0sGYahUGF
         KwdlB0KHpxc8bRlrHFtBPcBqbl8ovAJN5d0NSIrI/URmRL0WqtNeO167skkPuc99xAbL
         roSLbqVQklz+WNSlBRBoRpEyVwNiJJHkCn5UXMwmFjE7DDrpUe68c6XF9Y+9tIITgcI2
         syey9W859eb/dBx12ZKEc8jSiN3LaNW7ZulCWm5RpEuvOY7VUy3yukXWd0KRhV6kTras
         IgS3WeHs5ca48z9poy9rP7I4F8vAuLqqggLOaFoXU+ni+Ola5hY7FRoQQmMckpxvZodh
         PJbQ==
X-Gm-Message-State: APjAAAWI62sF/mq+x8+MStzTsssZuVdK+qzYOSD7rTzVF7SVSBZfhtWI
        yxjauYtixhhy1IIJxFWQWumRCNeciEqkwENkWUdztA==
X-Google-Smtp-Source: APXvYqwHmuwaXTie6DRnB7f2lgf//8rF6DjVZSN1QuMVGBJ289l/AcRLZmg8IoEK+iWoZjGbAxoINRhU6b4e60oNXRA=
X-Received: by 2002:a5e:9245:: with SMTP id z5mr379853iop.205.1571694063141;
 Mon, 21 Oct 2019 14:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190923135908.23080-1-aford173@gmail.com>
In-Reply-To: <20190923135908.23080-1-aford173@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 21 Oct 2019 16:40:52 -0500
Message-ID: <CAHCN7xLQvYbY_Pu5hQOO8o+1o8CAVvXq_-RM78Q=jYvtLxtmbg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add logicpd-som-lv and logicpd-torpedo to
 OMAP TREE
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 23, 2019 at 8:59 AM Adam Ford <aford173@gmail.com> wrote:
>
> The OMAP DEVICE TREE SUPPORT lists a bunch of device tree files
> with wildcard names using am3*, am4*, am5*, dra7*, and *omap*.
> Unfortunately, the LogicPD boards do not follow this convention
> so changes to these boards don't get automatically flagged to
> route to the omap mailing list.  After consulting with Tony
> Lindgren, he agreed it made sense to add these boards to the
> list.
>
> This patch adds the omap based boards to the omap device tree
> maintainer list.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Tony,

Are you ok with this?  I am not sure who to bug, but I am guessing
whomever it is will want/need your approval too.

adam
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a50e97a63bc8..0ee89575699c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11645,6 +11645,8 @@ F:      arch/arm/boot/dts/*am3*
>  F:     arch/arm/boot/dts/*am4*
>  F:     arch/arm/boot/dts/*am5*
>  F:     arch/arm/boot/dts/*dra7*
> +F:     arch/arm/boot/dts/logicpd-som-lv*
> +F:     arch/arm/boot/dts/logicpd-torpedo*
>
>  OMAP DISPLAY SUBSYSTEM and FRAMEBUFFER SUPPORT (DSS2)
>  L:     linux-omap@vger.kernel.org
> --
> 2.17.1
>
