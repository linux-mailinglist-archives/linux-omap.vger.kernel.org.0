Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD2C0E9B3B
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2019 13:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbfJ3MAx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Oct 2019 08:00:53 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42304 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfJ3MAx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Oct 2019 08:00:53 -0400
Received: by mail-io1-f65.google.com with SMTP id k1so2181404iom.9;
        Wed, 30 Oct 2019 05:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d4py8ng5wXpMr5cYgxc6n7h3nEMTISPpp6RpBa8PC14=;
        b=MjKM6KjteLS5/1/dy3WtshPNenZKcsTFo9cByYcy1tUaj1+R3IAfey6+Zf7etAXxBG
         A6nYspcZVEfGBzvgGIsMDmiaiB+KD0mByb/FdfrBULi/wy4Q0Nfmb8PDrOUJJWrNOy7L
         VANA/3M+QsIvyCoXb+sQJndXbu7lTG2CYcYb6E5bC2QCnE2hSNu4nNchbS367xuI7XSu
         VD7TI4heI/myB/whVGgeE2dB/gQvg0E8IJdFHSWRyaKtBuJZdJVvlWGzh27Wg9YnXh/c
         mtpo1PHYR8G9WoOeFhlg+wLg/uf7mfO/JdtprlkIr4nduvboheVHa2qke7k/cHdXstKE
         Dnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d4py8ng5wXpMr5cYgxc6n7h3nEMTISPpp6RpBa8PC14=;
        b=Jb8dcsuVlrx00jHruCTAlDhZaMtXHEV+rf5MGwVybiVUw3S6Xyu8L/lNzfXdamdaOD
         Z8r27GJDPsXmNu+I4EEFhViwFvsBmVa+Xugdj0pntkh5A8QRklqNsqD4q62rdkcqgFi1
         1tdSmbFMAWvnZQn8PtfASX1AtJ8D40w048BOWiCRDSxhzQTPW2UWpzOweE8wzdjO5/fJ
         Y0Kmz9/p4RNNWdgO+A9Hb0YM7yRffRLqElzG6GAex18hNqbLKy4u3d5Piko/y7x7TjAJ
         XGMOmjHLHHreJaGuE4sj6/hVyU6QgmR6fRerK2swDDZoVqEjsXF2B/ypoMlE9ggw1S7b
         RXJw==
X-Gm-Message-State: APjAAAXsTRJCx6cvDi0sk6xfGgC4RYgsTfSH9DZEYav7Bs9aS3YQhEL5
        V5f5Db9tGFpNo88lt3iB2QBUtpfHTT6JEu5YzCY=
X-Google-Smtp-Source: APXvYqwSkWwC+grcku8GH8N7R5a02dES/ihI7RDUKgmMZTYHfpQmsAhtsVpl/3ezfNV9XV1vDzvM48nWPxXtEK6Bfw4=
X-Received: by 2002:a5e:9245:: with SMTP id z5mr2660581iop.205.1572436852244;
 Wed, 30 Oct 2019 05:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190913153714.30980-1-aford173@gmail.com> <B710D701-6311-4344-BF4E-F39157BBF2BD@goldelico.com>
 <CAHCN7xKU1v-BFkwiuZQx82+Cmdgj_1CH1j51bN0TaaduWcu8rQ@mail.gmail.com>
 <97204F98-FA33-4EBA-80AC-2FB3A6E78B2B@goldelico.com> <CAHCN7xJus=Unsm5rvgtccM9jpdiwGnJXrfjhavwkoswGbNd7qw@mail.gmail.com>
 <CAHCN7x+=O6f4Q0ps1d5KA+-E9L-8wr5B9XggzurJWtEnxEj7yg@mail.gmail.com>
 <FD6FED45-EF20-49D8-A2B2-012FB314DCC6@goldelico.com> <CAHCN7xLN+52ZW6tzCQPDvwqrdgaQaMrkhPFPotYDr7RdNwqeNA@mail.gmail.com>
 <C469028D-959D-4BD1-9226-C0190A197CE5@goldelico.com>
In-Reply-To: <C469028D-959D-4BD1-9226-C0190A197CE5@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 30 Oct 2019 07:00:40 -0500
Message-ID: <CAHCN7xL5sqLzaJ9b0721iAUeEb_pKB4QaeXfF94TZLQ7ZaS+bg@mail.gmail.com>
Subject: Re: [RFC v2 1/2] ARM: dts: omap3: Add cpu trips and cooling map for
 omap3 family
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>, Nishanth Menon <nm@ti.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Grazvydas Ignotas <notasas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 30, 2019 at 3:40 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi Adam,
> what is the status of this RFC/PATCH?

I've submitted a formal 2-part patch [1] and [2], but Tony is
concerned about power consumption.  As of right now, I don't have
cycles to work on it.  My employer is about to release two new SOM's,
and I'm writing up some documentation on some of the older ones to
help some of the developers working on the new ones make their job go
quicker.

[1] - https://patchwork.kernel.org/patch/11178561/
[2] - https://patchwork.kernel.org/patch/11178563/

I requested if we could apply them as-is with 'status=disabled' for
now until the bus is fixed, but I think there was some push-back.

I'm trying to get to it.  I am hoping to find a little time this weekend.

adam
>
> BR and thanks,
> Nikolaus
>
