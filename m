Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99ADE35560C
	for <lists+linux-omap@lfdr.de>; Tue,  6 Apr 2021 16:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235945AbhDFOGw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Apr 2021 10:06:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:39086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233227AbhDFOGv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 6 Apr 2021 10:06:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10E3C613C4;
        Tue,  6 Apr 2021 14:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617718003;
        bh=CQkqAyjhsoQFZIyIYvLUOhXpo7lnAR7GuZPZMplquU0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C2gAYBhAs4KkkWQaRjE9U8Y8opCsV8drwkxrNX6Aicy/E4paHRHrkgbpS7N9ad8ul
         hVEsKdiu8n3Fef9tB3mZjp/PH7lfSi2QrwnHkek2MviUmPg0VF7QxCdPXuQkZLenM1
         cLQyPhweEDz9EKjtKXqrSAurIsrYz8DWyri4XE62SQ1gl1ncRTL3m3hZpTspgzemiO
         UcytOZqB7J3MVcm1Lt/0umdE86aHK0OF31Y3rs4oSbyfjUDtf4weMARGo15b8SBpww
         TeyLqCkT09bFfe+HhNU5zYG7IkRQvjkVnawjcJdyL9rbvGOAnxzx9Q9i1cJTEMCD4D
         nnZyIVkPaertw==
Received: by mail-ej1-f42.google.com with SMTP id a7so22181489ejs.3;
        Tue, 06 Apr 2021 07:06:42 -0700 (PDT)
X-Gm-Message-State: AOAM530EleuybtP1Ik/QFHu8jvbry3NFGgOhJXcaVem1jZevaxCaXD+s
        u2bEC5su7vM0uGMQbGRSKse0+ROkk/6MA+Tmow==
X-Google-Smtp-Source: ABdhPJx8rAyWkSOqiax6jgSsYlFFrVm8RG6wg33J9TbZWbMXhlJ12SFzPZSuwcTnZoc2ePClOpJGjMXyyDYnvArg+3A=
X-Received: by 2002:a17:906:813:: with SMTP id e19mr7792178ejd.359.1617718001625;
 Tue, 06 Apr 2021 07:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210402192054.7934-1-dariobin@libero.it>
In-Reply-To: <20210402192054.7934-1-dariobin@libero.it>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 6 Apr 2021 09:06:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKkpZw_BmcCXUzahF-FkQ=vb7mb_s95Lm2G7pWo0=dqNA@mail.gmail.com>
Message-ID: <CAL_JsqKkpZw_BmcCXUzahF-FkQ=vb7mb_s95Lm2G7pWo0=dqNA@mail.gmail.com>
Subject: Re: [PATCH 0/2] fdt: translate address if #size-cells = <0>
To:     Dario Binacchi <dariobin@libero.it>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bin Meng <bmeng.cn@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Apr 2, 2021 at 2:21 PM Dario Binacchi <dariobin@libero.it> wrote:
>
>
> The series comes from my commit in U-boot
> d64b9cdcd4 ("fdt: translate address if #size-cells = <0>")
> and from the subsequent exchange of emails at the end of which I was
> suggested to send the patch to the linux kernel
> (https://patchwork.ozlabs.org/project/uboot/patch/1614324949-61314-1-git-send-email-bmeng.cn@gmail.com/).

It's 'ranges' that determines translatable which is missing from the
DT. This should have not had a 0 size either though maybe we could
support that.

Does the DT have to be updated anyways for your spread spectrum support?

> The second patch of the series aims to demonstrate that the first one, which
> enables the translation of addresses also for crossings of DT nodes
> with #size-cells = <0>, it really works.

I don't seem to have the 2nd patch... In any case, you should handle
the special case for this platform in code for the platform.

Rob
