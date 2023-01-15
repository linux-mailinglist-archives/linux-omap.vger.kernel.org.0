Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 888FF66B387
	for <lists+linux-omap@lfdr.de>; Sun, 15 Jan 2023 19:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbjAOSxy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Jan 2023 13:53:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbjAOSxx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 15 Jan 2023 13:53:53 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D49113E2
        for <linux-omap@vger.kernel.org>; Sun, 15 Jan 2023 10:53:52 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id q5so929344pjh.1
        for <linux-omap@vger.kernel.org>; Sun, 15 Jan 2023 10:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zroLY3DEZIi12zUNN7HI+R52uRqBScm4WCcf5UP35Kw=;
        b=n2ndqPOLMqcDGTLcUHjiS7nj9J0mYrNSNvZLGLeiCw/SvPmTxxMTGUxRUoPvi6lnyf
         TuMIyM795V1neSZno2zzrf0EycOcwG4DZMA3NKP0mAOYOCWvPJHPqIBPgtw5BZCcODfL
         V7RsKAHXTLfCTijYyq12Jwjm1WPN34qbEcvoznkgeznSyeKyX5Tf9Kb95nIsG2FRLOLg
         uj0COeNom+JxniKq/tw1K7eKL5GiAt/hJakICPK83RHNYGiEzGUWWYMCLLWNs+lniQN8
         Fi0g31JQgJDNTv1fTvMDf7tasqdYQj4OZvXrF8nPn0rwGjxE2s/P+zAG3PZjlObPoZzT
         eDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zroLY3DEZIi12zUNN7HI+R52uRqBScm4WCcf5UP35Kw=;
        b=fQVRTU4L8coRD131qKpxVnzV5b+VKhMFnjc2aPxyV1L/lhM23yoSKrOXamJl+97d6A
         hrGByzXlpeXqCZrzjxfTm/MTNuOLx0yjfttYl+O+GPIjW0RxspgWAEadGuSK77GtuB7o
         EmAYQhM4GjghAnxgGx4b85JgZNfaVRIG00KNgExpYT6MwoTo9aSuifEOYfBfz0AK4m3w
         epznidL2ms6HKRnxl+LZLYlqNXyDGe4GSRnMOkWsYN7BodgtEgtCO4Tkv6mMN0g7aJS5
         aT7rw2MaTw6avJ7IsNVALSxIeH7V0rDqrBVmZ62Zzo07cErA+mjS54P9zN8ckqPGm8lw
         k9nQ==
X-Gm-Message-State: AFqh2koC3gf4JC1THkS5mTDwmLhGbPdPmr8KWLmZfndMfCKXtwVS369d
        fDF54HU2sgN291G2S7kfteX1qjmdBkKb8XTCiQ0Ef2r+
X-Google-Smtp-Source: AMrXdXvH9BU6QysmPMIsIFnJj4E5K8hcm4E03gf7/jUKBvhMhGEibuQti+r4UvczjG+mDuu96agKmS2Z6nVCACt3m+w=
X-Received: by 2002:a17:902:b112:b0:189:bee:65ee with SMTP id
 q18-20020a170902b11200b001890bee65eemr460903plr.107.1673808832157; Sun, 15
 Jan 2023 10:53:52 -0800 (PST)
MIME-Version: 1.0
References: <CAHCN7xJT+1XP-LHyzj0GB5rDnVP+EgGmUVb6h4uTJA4bVE1yPg@mail.gmail.com>
 <5DD8AC17-A7FD-4D44-953E-F2EF84C6896D@messlink.de> <CAHCN7xJZgy1HKp-sHtqZeKAa2uKFtLLGeEguJoZRB+RswEfgJg@mail.gmail.com>
 <CAHCN7xLrDGMNKyXw6Eb9LJSHm_wDF2N3PjDKUtZ6LKTvQOxfFw@mail.gmail.com> <Y7us8Ann7tjJ5lcn@atomide.com>
In-Reply-To: <Y7us8Ann7tjJ5lcn@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 15 Jan 2023 12:53:40 -0600
Message-ID: <CAHCN7xJeBcZ18u5Wrcv5LW7NJr6UC6RhvHuqq5-obECsfnEo2A@mail.gmail.com>
Subject: Re: omap_hsmmc RX DMA errors
To:     Tony Lindgren <tony@atomide.com>
Cc:     "H. Nikolaus Schaller" <hns@messlink.de>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Jan 8, 2023 at 11:58 PM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * Adam Ford <aford173@gmail.com> [230105 19:20]:
> > On Thu, Jan 5, 2023 at 1:08 PM Adam Ford <aford173@gmail.com> wrote:
> > > On Thu, Jan 5, 2023 at 12:17 PM H. Nikolaus Schaller <hns@messlink.de> wrote:
> > > > Am 05.01.2023 um 18:54 schrieb Adam Ford <aford173@gmail.com>:
> > > >
> > > > Would there be an objection if I migrate the OMAP3.dtsi file to the
> > > > newer driver?  I wasn't sure if there was a reason this family was
> > > > being held back from the newer driver.
> > > >
> > > >
> > > > AFAIR Tony wanted to retire the older driver anyways.
> > >
> > > That was my impression and it appears that the AM35x has already
> >
> > correction AM335x (not AM35x)
> >
> > > migrated to it.  I wasn't sure what was holding us back.  In theory,
> > > we could add the compatible flags to the new driver and mark them as
> > > deprecated so the new driver would work with older device trees if
> > > there was push-back on changing the device trees.  I know sometimes
> > > there are concerns about using older device trees and the interaction
> > > with the compatible flags make it a bit more complex.
>
> Things should be ready to flip the remaining SoCs to use sdhci so we
> should do that.
>
> The only thing I'm aware of is that sdhci will try to keep probing
> also mmc instances that are not wired. So some board specific dts files
> may need to set some mmc instances with status = "disabled". Or maybe
> the sdhci driver can be configured to stop trying after some timeout.
>
> Regards,
>
> Tony
