Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45710413308
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 13:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbhIUMBF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 08:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbhIUMBF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 08:01:05 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1155AC061574;
        Tue, 21 Sep 2021 04:59:37 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id bx4so28912094edb.4;
        Tue, 21 Sep 2021 04:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KHxdyV8EyJ0XBPQEDxJ1v4h9kj1JfLTsZlYSfzSaMA0=;
        b=HlBo9gi3cYBrHujgvixSoBUWSIePnuwaETvI0dM2Zg0LvfzLZ7Rd2nOyujd9kLs3xM
         RA+PE9pbT4RBXfsXmbqlJsds5UuHBuekAngHh3DPOwjrFg/lQSEOATEtrnsUIu6NeMS6
         9EtSMV8JZOu/qiO0/PmvpUfhvQ0g7IyvWPKaP9fFMpWMmC2N3np2yhUWq+yLfmOyTGv3
         LBmVy4gS2+4LPpRwBTyhtMThNelJr30jqSJSc+iGNxTKI5dvyQIfIdmoFgryXPYtvDdK
         XYCuQ5NDxTbv3DlHEhKkBogdlGHW/RW5sdfCzetPJXUthJJ7ppx4I9ilKuhGktpqHu+q
         B2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KHxdyV8EyJ0XBPQEDxJ1v4h9kj1JfLTsZlYSfzSaMA0=;
        b=O54PU5FsxTHkR7p+YMUGqap3hnef4XwgkEsW5ClgFs1zvUuzKIcSIlOOzgajz5g75T
         3flcdA5lZWyDBj1Z9NZYQ/zLUZtaSZnkV+ayObTLFaMjGvIjkwdxuFU6ai9hfh2Knjt2
         sLr30cD21FI3nnlqnGu1cOUpwdN1khu3AFTcwbLpO3m6w7DUfHpcohkS0XI9fFOyYWBg
         zn7Ulx2cV2NPJgzSYINXFszmt0OlCPPDCI/B+izPHvhAT6TlXLvtzp5pxTL9CCpz7Vau
         TLxNvH7xTRtN+ERprT74zg9UEkbtOskMpoY8BP/xmXXJeXyVSiUQ8f2Td8kGW1fUdeNF
         3yRw==
X-Gm-Message-State: AOAM53265p9LgQ/l0IPWjPCXwyQjRo3aoX4PncbuJgy+z5Arvyu4yX0x
        i6W+Ld/V4JkEx++qarZEgr5yjRBllre/CxHARAI=
X-Google-Smtp-Source: ABdhPJxmDNUrn/pjfqGBtuarR0ifn3xMY97hBg31i3Lrvhgn4lXmgIdu/Mx35BIvjqGEfO7bu1TPzpTPeYd3gQihQQU=
X-Received: by 2002:a17:906:90c9:: with SMTP id v9mr32826020ejw.356.1632225573722;
 Tue, 21 Sep 2021 04:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210921103346.64824-1-tony@atomide.com> <20210921103346.64824-2-tony@atomide.com>
In-Reply-To: <20210921103346.64824-2-tony@atomide.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Sep 2021 14:58:55 +0300
Message-ID: <CAHp75VeBM-k39HJWe8cyiz+7sKbgMwJLivOGSs_8=nMADUbukw@mail.gmail.com>
Subject: Re: [PATCH 1/6] n_tty: Start making use of -EAGAIN returned from process_output_block()
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 21, 2021 at 1:34 PM Tony Lindgren <tony@atomide.com> wrote:
>
> We check for -EAGAIN in n_tty_write() but never currently get it from
> process_output_block(). Let's add -EAGAIN handling and break out with 0
> bytes processed. Note that if we return -EAGAIN from n_tty_write(), it
> will be treated as error by the caller rather than a retry.
>
> Looking at the patch description for commit 9ef8927f45f2 ("n_tty: check
> for negative and zero space return from tty_write_room") it looks like we
> have not made use of -EGAIN from process_output_block() so far, so this

-EGAIN?

> does not seem like it's currently needed as a fix.
>
> We can use -EAGAIN for serial layer power management changes as we now
> will make use of write_room() returning 0 for an idled serial port.
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/tty/n_tty.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/n_tty.c b/drivers/tty/n_tty.c
> --- a/drivers/tty/n_tty.c
> +++ b/drivers/tty/n_tty.c
> @@ -549,6 +549,8 @@ static ssize_t process_output_block(struct tty_struct *tty,
>         space = tty_write_room(tty);
>         if (space <= 0) {
>                 mutex_unlock(&ldata->output_lock);
> +               if (!space)
> +                       space = -EAGAIN;
>                 return space;
>         }
>         if (nr > space)
> @@ -2287,8 +2289,10 @@ static ssize_t n_tty_write(struct tty_struct *tty, struct file *file,
>                         while (nr > 0) {
>                                 ssize_t num = process_output_block(tty, b, nr);
>                                 if (num < 0) {
> -                                       if (num == -EAGAIN)
> -                                               break;
> +                                       if (num == -EAGAIN) {
> +                                               retval = 0;
> +                                               goto break_out;
> +                                       }
>                                         retval = num;
>                                         goto break_out;
>                                 }
> --
> 2.33.0



-- 
With Best Regards,
Andy Shevchenko
