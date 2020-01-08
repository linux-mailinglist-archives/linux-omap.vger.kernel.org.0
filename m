Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 878E113387C
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2020 02:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgAHBc4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 20:32:56 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:45109 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgAHBc4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 20:32:56 -0500
Received: by mail-qk1-f195.google.com with SMTP id x1so1235690qkl.12;
        Tue, 07 Jan 2020 17:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D0KWS2bmnM2w8jSnvLb5h60Kle/fBeOTfLYPIJ5EOpY=;
        b=Ol69AOK30CK/wW/0zqC9CsW1HvPIgqDWQv+yLkWghIobQmMiQKDVzMPsmU6VGcbj2j
         lNc5vC9vNZ5yzIHQu17kb18tdqaFOutepb79PUrlkLkIzxl3mhqnOZYdXUGnTlNTldN6
         ryDhkieOk3mxRQ6p9CZuZJQOaA6Fokwva4Pvy29yp1316hmyz91f23wTYEktJDEFQfiC
         K2uCyh/GM7XDFk4Jr0qYvyXTuzDA80lch4BU/4/lrp8uLbPbLH01YO0dC4fLhZdZABHv
         Frc+6f3MHRVThvj0MxTWx6OIdRNY+mj/bslQJeYAyXsJIekSmsQLjF+8rXDYQDSHA5qK
         UkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D0KWS2bmnM2w8jSnvLb5h60Kle/fBeOTfLYPIJ5EOpY=;
        b=HwP4YM732NsaCC0xLbwr2URJni8GxwLXwW8lCYtaYz/oR1djfc1F6SvdMvYVLJwiYF
         q/MCQWVY5Fcz86Ac4kCA8tSvcJ/bjQcbr0ZUC9cOJqANVkvd6q/9HHOIX9ldYYk3akDG
         N1aXY4nvamAFtMqCvGlXXRfNwcYQl+9zS6mxX31fvQDTecZfbHe/h+jNpNwbC28Q/LXp
         lYL5GkBGMuIYgIeQUklcTkYPefJvAnsa/A8FkFLv/6tT+yHLdbRarRADSzu5ylkLZTPg
         AKvCuERvDmqSX8x33FC2IeBkB0yYqDhJNb6T3WOMqc/nCSULb+ofHMtprj0Zjyb83QPK
         lUHQ==
X-Gm-Message-State: APjAAAVI0Oz9tKqVSzroT9RerNokD8SJJ+Y79DdgfFEZODg60k6b4lhC
        VSlumLhMs/KHE+GWp5sUAgraAAlObSEqWcKQRNjym8M2
X-Google-Smtp-Source: APXvYqy6eIHyxCmknwk6MCfrWtg1wQT3fooOJigafTIomk2b84KDncPi1Me0AaxLv52BmtSGaJXrsV2Sy4zLQDobXAQ=
X-Received: by 2002:ae9:c003:: with SMTP id u3mr2075595qkk.133.1578447175126;
 Tue, 07 Jan 2020 17:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20200106110133.13791-1-faiz_abbas@ti.com> <20200106110133.13791-3-faiz_abbas@ti.com>
 <CADBw62qR5F8h4YbpWfU2UESeoR3zXzS=eePMvQHuT7NQE5hdSA@mail.gmail.com> <27fded85-d195-0a82-899a-bb6e727258dc@ti.com>
In-Reply-To: <27fded85-d195-0a82-899a-bb6e727258dc@ti.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Wed, 8 Jan 2020 09:32:43 +0800
Message-ID: <CADBw62pA3tub70Uvkz7_6HTqvpuvweroGJXScv5NdPcDViG0Dw@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] mmc: sdhci: Factor out some operations set to
 their own functions
To:     Faiz Abbas <faiz_abbas@ti.com>
Cc:     linux-omap@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
        kishon@ti.com, Adrian Hunter <adrian.hunter@intel.com>,
        mark.rutland@arm.com, robh+dt@kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>, tony@atomide.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Faiz,

On Tue, Jan 7, 2020 at 3:20 PM Faiz Abbas <faiz_abbas@ti.com> wrote:
>
> Hi Baolin,
>
> On 07/01/20 12:04 pm, Baolin Wang wrote:
> > Hi Faiz,
> >
> > On Mon, Jan 6, 2020 at 7:01 PM Faiz Abbas <faiz_abbas@ti.com> wrote:
> >>
> >> In preparation for adding external dma support, factor out data initialization,
> >> block info and mrq_done to their own functions.
> >>
> >> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> >> ---
> >>  drivers/mmc/host/sdhci.c | 96 +++++++++++++++++++++++-----------------
> >>  1 file changed, 55 insertions(+), 41 deletions(-)
> >>
> >> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> >> index 1b1c26da3fe0..f6999054abcf 100644
> >> --- a/drivers/mmc/host/sdhci.c
> >> +++ b/drivers/mmc/host/sdhci.c
> >> @@ -1025,18 +1025,9 @@ static void sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
> >>         }
> >>  }
> >>
> >> -static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
> >> +static void sdhci_initialize_data(struct sdhci_host *host,
> >> +                                 struct mmc_data *data)
> >>  {
> >> -       struct mmc_data *data = cmd->data;
> >> -
> >> -       host->data_timeout = 0;
> >> -
> >> -       if (sdhci_data_line_cmd(cmd))
> >> -               sdhci_set_timeout(host, cmd);
> >> -
> >> -       if (!data)
> >> -               return;
> >> -
> >>         WARN_ON(host->data);
> >>
> >>         /* Sanity checks */
> >> @@ -1048,6 +1039,36 @@ static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
> >>         host->data_early = 0;
> >>         host->data->bytes_xfered = 0;
> >>
> >
> > Can you remove above redundant blank line?
> Ok.
> >
> >> +}
> >> +
> >> +static inline void sdhci_set_block_info(struct sdhci_host *host,
> >> +                                       struct mmc_data *data)
> >> +{
> >> +
> >
> > Ditto.
> Ok.
> >
> > Otherwise, please add my tested tag if feel free.
> >
> > Tested-by: Baolin Wang <baolin.wang7@gmail.com>
>
> Which platform did you test this on?

I tested on our Spreadtrum platform for the common sdhci driver
modification, but our host controller can not support external DMA, so
I can not help to test the external DMA.
