Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 751A82B4C70
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 18:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731802AbgKPRRu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 12:17:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731211AbgKPRRu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Nov 2020 12:17:50 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4403C0613D1
        for <linux-omap@vger.kernel.org>; Mon, 16 Nov 2020 09:17:49 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id v11so13378716qtq.12
        for <linux-omap@vger.kernel.org>; Mon, 16 Nov 2020 09:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RY7dzZjNXgsnJCVVQm8TyT/jUzYsH7NzXH3Mac7B9Rw=;
        b=Wf3kB4A140V5E08ma2vQlRfFr7iwHao00b8EDxrwHAUlbrApv9/MDn9ZD/TXcGlNj+
         rRfETVYLjXsvAsVTe1GfWzN1dC8IPcJbeLuscQx38hNfq+/vfXpQ9iTB6bhtkOEIbn3s
         gOs8ztPYmRMRtsLn0Icorskz/foCpzs1RS5K3e5F6svPBHTtXmOFB1nVnjOubd4Vrb9O
         IYlOuEfsNgWsXVO47Irs1t48pObB+PKbjCRO1/40tkKh0DEF/hSo573z6dmQQzRQ9A/K
         DMujZU+uI8hdyIwAFsJzjXvPPrjVjcg9DwaEujb6eZi6XW2FqjIWTQQyxnB0+4JaN1GN
         CMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RY7dzZjNXgsnJCVVQm8TyT/jUzYsH7NzXH3Mac7B9Rw=;
        b=K7xmLV+2iZmWTnjQeBE+x7d4WTlBE1Q/pjTCeOP1ieyCsnG8cfFv85EWViYu27qB+H
         GA1NTlZvpsNJ/nL6+su624MZzcOmHyekV7zPeacdKcglFuOBPujxn6Z9xIZsOMiURIh4
         JYbQ6doxEX2ObDQzpyNQiSGSYynnQ6LrYOvBR2xp+UTZzZjedhEHouRbIS4AxJhR/6fZ
         os2+J/RO/oWxnIMIhzyzQP5nO2YpTb4KsidmC/WCOmiNnot9Z8iStKjgJmps8vk49bah
         znP03Gn2SuM49XbSTyGQlFqcKZ8zYv86FBY7kTOkQcIGOhOJVi0+Guiy+xKchman1dMk
         1HBg==
X-Gm-Message-State: AOAM530/kkmmVkPX6wMJIU9KSLsUHmfW8Gm3WKN2fqnQVhp1l2Dwj+py
        NwfRAsTsUiqLwzNzrGLi8+MCQncc3hXDCBf2mrbt+w==
X-Google-Smtp-Source: ABdhPJy1GZi3KsRmAdk3ycATA59ZxIy129o62tCASlipDogQ69pc6V+0XGxARQ9IQ0+E6+bmdfk9CCJ24zuhMKmPwyk=
X-Received: by 2002:aed:22ab:: with SMTP id p40mr14640722qtc.200.1605547068880;
 Mon, 16 Nov 2020 09:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20201026144943.30821-1-grzegorz.jaszczyk@linaro.org> <a1a787b2-efac-3baf-2a3c-ba135b8b32d0@ti.com>
In-Reply-To: <a1a787b2-efac-3baf-2a3c-ba135b8b32d0@ti.com>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Mon, 16 Nov 2020 18:17:37 +0100
Message-ID: <CAMxfBF4SJsPYZqr5nB4puQAFPGWh6X-L6ty027dAJgdUvy9EZw@mail.gmail.com>
Subject: Re: [PATCH] soc: ti: pruss: Remove wrong check against
 *get_match_data return value
To:     Suman Anna <s-anna@ti.com>
Cc:     Santosh Shilimkar <ssantosh@kernel.org>,
        Santosh Shilimkar <santosh.shilimkar@oracle.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Bajjuri, Praneeth" <praneeth@ti.com>, tony@atomide.com,
        Wei Yongjun <weiyongjun1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Suman,

On Tue, 10 Nov 2020 at 21:43, Suman Anna <s-anna@ti.com> wrote:
>
> Hi Greg,
>
> On 10/26/20 9:49 AM, Grzegorz Jaszczyk wrote:
> > Since the of_device_get_match_data() doesn't return error code, remove
> > wrong IS_ERR test. Proper check against NULL pointer is already done
> > later before usage: if (data && data->...).
> >
> > Additionally, proceeding with empty device data is valid (e.g. in case
> > of "ti,am3356-pruss").
> >
> > Reported-by: Wei Yongjun <weiyongjun1@huawei.com>
>
> Please add the appropriate Fixes: tag.
>
> And prefer %s/Remove/Fix/ in patch title.

Sure.

>
> With that,
> Acked-by: Suman Anna <s-anna@ti.com>

Thank you, I will post v2 with all improvements soon.
Best regards,
Grzegorz
