Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70C8C9D003
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 15:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729569AbfHZNEr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 09:04:47 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33657 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfHZNEr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 26 Aug 2019 09:04:47 -0400
Received: by mail-io1-f68.google.com with SMTP id z3so37113027iog.0
        for <linux-omap@vger.kernel.org>; Mon, 26 Aug 2019 06:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pG9InRDoEqdrq+oJQPmZ/2Sb+rcv+ZZwneflPLDdN/c=;
        b=lGAuN4m3Eo41HFfVrBWLSLJsdXMTI2KPBZkq4PAN2Xnzva3CGJUToj8pgm0Huxqn6I
         nmUGonDUTuUYXgVyU3Jymt9HeHKEJWZFooGicC6Y7aTdc+0H9AbA4PP7qMZZvdWZNqLs
         /paUueyh98hxiZFoekdc2eRPEJG8548DAwzM4jveMb5H60TYBHqUGdflfS277B+NvJW4
         nvose6pC91P/VK7EwbJFZLX372R1C7NMcfPsQa6F9L7cQsWEi0gwfkrze4zI2JfRfI+o
         zIMsoNFJHd3OmqpPwz4IgBXxzhoApJRw22L5NpaSoGv5ZOFHWVJy9Y395B/Qjyddys12
         eZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pG9InRDoEqdrq+oJQPmZ/2Sb+rcv+ZZwneflPLDdN/c=;
        b=jSEBT7cfoWo8oRfiSIrZfmuHgj6dGWqBhnIg8NeO4F8mnb25HCCKljoXEPr9QBIEfT
         RSvR3YtOLxB+9uK065zgUx2Yv4rggpKF1Q3hfQ9+SvLtkz4R4ZqEr4MbjtL7BEuvLsq9
         8QpkFK8h80RjCb3rad2DmUfYc9SHY1u6nfspbrMLVylFI67I2Xe/CZjgHUEqTwXWiVLv
         sh1lGf4s+M9pxycB0iW8ojEzzcF4nLs5YhgJFngzv/H0mES+o1NKlxMctb+xAdMocRD1
         DV1P9AcaOPslkYOlxgT2d7vUZwvnCcZuLNs/NVVtvjFM9hdIMu6T+gFqeTTIHbA2hZ/x
         xzew==
X-Gm-Message-State: APjAAAVrNKhMSzoccvr5qV2ldVbvJIODOmwrpR3wlEsAerdKjnDSd1zH
        oBmIKb5PGkeqqj22+DnMbgqEJU8tOFznitp7NqkTAA==
X-Google-Smtp-Source: APXvYqzeE9UMQJjUvQw+RfQRHGWSNK9oV2l0NJ7Y4aRfJEc7JVX+YjS/H1AN9AWUmer9vpeVkMKBi1DWTbTB820lXaQ=
X-Received: by 2002:a6b:c581:: with SMTP id v123mr141450iof.158.1566824686169;
 Mon, 26 Aug 2019 06:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190821125502.32187-1-aford173@gmail.com> <20190823222658.GQ52127@atomide.com>
In-Reply-To: <20190823222658.GQ52127@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 26 Aug 2019 08:04:34 -0500
Message-ID: <CAHCN7x+QBw_ZaXxucMk7-jD70mWa=PdMKUvrLtN=fmV=VMcBTQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: Configure rstctrl reset for SGX on AM3517
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        =?UTF-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Aug 23, 2019 at 5:27 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Adam Ford <aford173@gmail.com> [190821 12:55]:
> > Based on Tony Lindgren's work for omap34xx, this patch applies the same
> > functionality to the AM3517.
> >
> > The following can be tested via sysfs with the following to ensure the SGX
> > module gets enabled and disabled properly:
> >
> > 0x00010201
> >
> > Bus error
>
> OK thanks for doing that.
>
> > Note that this patch depends on the PRM rstctrl driver that has
> > been recently posted. If the child device driver(s) need to prevent
> > rstctrl reset on PM runtime suspend, the drivers need to increase
> > the usecount for the shared rstctrl reset that can be mapped also
> > for the child device(s) or accessed via dev->parent.
>
> Care to check the subject and description again.. I don't think
> this one uses rstctrl resets :)

I am not entirely sure what your patch does, I just copied it from the
34xx to am3517.  Since the code is really yours, would it make sense
for you to push it and I respond with 'tested-by" message?  I don't
really want to claim it.  ;-)

adam
>
> Regards,
>
> Tony
