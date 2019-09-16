Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7C27B3E4F
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2019 18:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731932AbfIPQAb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Sep 2019 12:00:31 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41941 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbfIPQAb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Sep 2019 12:00:31 -0400
Received: by mail-io1-f67.google.com with SMTP id r26so208853ioh.8
        for <linux-omap@vger.kernel.org>; Mon, 16 Sep 2019 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uJFnO64MSz9d7/WuanPssGDfWnb1PSNsv0yD0uLmljM=;
        b=ouJa2yWwGi+ZH/jHv3cj+vFtF5LDlRbbRAyfjEpxeFn+DDJR1p73D1gn4P/F0klfBW
         +20j6GMfQ5zdX2UXCCgtRMT5QawEhZpBEl9N3WmbeaTcl6TVXQnmHtyccXw0WZZilV+M
         F1bwSK9RFvsucYfuddoud1hSfCZ3qkGPR73tOTOORFBLC7iX+7tzUV0n6O23KqAZFQCW
         Qreic66tnUlD6hfwOkmNMIT0KxbBq79Il+xVGCqD4bM5X+AqdLV1oqMcs93I2Gz+t56I
         wcJiSLedfY14JgynL3sb7we6KjydhwkIjPGiSEb5gYvqzoQaMnLpEUdys4W1b4yIUUdg
         0JIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uJFnO64MSz9d7/WuanPssGDfWnb1PSNsv0yD0uLmljM=;
        b=X2NLqfof58hQBVOei/e0AuxBKyfc6gRoHGT8tthMX+PqRA2vYJh5lgPQ3aROV9FctC
         HfefuxZmv7BItKkPW50kQ8CgUKMsKGRDbFx9bdciCGfrjRK9/m8fObeaEnnDSiTEDW6O
         1EUmL7eiszJRmcks8C4I2fP2k0sq+HUhXBb3EvsZ4R6v+sOA3Abz/mJ6wTMoVaA6t5KC
         Bm/ZPpsIHhG0Ieoh48eFDNHjSa0HYfJj9N670HaNkJUieqMicVnITOqH4oFjwYk44aVs
         501u9jA9m0aclu5ybcOvCExNuIzMy9Q8LOmiJvLiBDJzauZuq0EbY7ETs4vCUUEYUXyT
         IUeQ==
X-Gm-Message-State: APjAAAXF5e+L3f973KSWDMNdj1bR7MH/sjKvctEEtHWRs9eptq2vmVjK
        qYoyJeNf7m+yfo98juxjTPozDRzKrnt7KCNZtukcVxZD
X-Google-Smtp-Source: APXvYqynfCeyMQ9BOO6uXuvUh4Yhb9DnCqHeYRq1r4cbQjVMZmob3aISXOqNuguL+tXVzYUKJ8q6odeo8vf/NE+Fnzc=
X-Received: by 2002:a5d:9619:: with SMTP id w25mr670678iol.158.1568649629973;
 Mon, 16 Sep 2019 09:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJZk-7+6=13arKHdTkNoEANeZr2hUZu+AbDzw5m9vQLWQ@mail.gmail.com>
 <20190916154554.GA52127@atomide.com>
In-Reply-To: <20190916154554.GA52127@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 16 Sep 2019 11:00:18 -0500
Message-ID: <CAHCN7xKsmdcXTb+Wy4BDDqCzpDuetF2GK7cqvKuCTtWfOj62Jw@mail.gmail.com>
Subject: Re: [RFC v2] ARM: dts: omap36xx: Enable thermal throttling
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 16, 2019 at 10:45 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * Adam Ford <aford173@gmail.com> [190913 21:12]:
> > Tony,
> >
> > Go ahead and discard both the original and v2 of this.  Based on
> > feedback from others, it seems like the other series I did which
> > configured the temp sensor for all omap3 should be sufficient.
>
> Yeah OK I've tagged all the RFC threads as read now.
>
> > Once there has been enough time for people to review the other RFC,
> > I'll resubmit with a more proper patch giving some of the credit to
> > Nikolaus for convincing me to do this.
>
> Yes please do :) At least I've already lost track of
> all the pending patches related to cpufreq and thermal
> and voltage stuff. So several complete non-rfc sets
> is probably what everybody is waiting for to review.

AFAICT, Niklaus' patch series for cpufreq is no longer in RFC status.

https://patchwork.kernel.org/patch/11141655/
Once his patches have been applied, I'll rebase and resubmit without
the RFC against whatever branch you want.

I just want to make sure I'm using the right base from which to start.

adam
>
> Regards,
>
> Tony
>
