Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1477C0527
	for <lists+linux-omap@lfdr.de>; Fri, 27 Sep 2019 14:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfI0Mai (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Sep 2019 08:30:38 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:45317 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727360AbfI0Mai (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Sep 2019 08:30:38 -0400
Received: by mail-vk1-f194.google.com with SMTP id u192so1156862vkb.12;
        Fri, 27 Sep 2019 05:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OMiXiE1v8IgRSadGW84gcwWEfYoV55Ysd0H2CRvXZ+w=;
        b=LZlN/KU4mPDj5hIogsauZFPzta4hAIBb9vzUCSyDnacdtzlhhpDt7htpzR+0Cc32qS
         Wrynt/S4aqIHgXmUF4cUQrxPm+h0Up/u9bUnoZGg89xGcQop/m7pMqUYdETTKSaBEWdd
         mBIZmGHnKHk/vJ69GTVgPsdV2Py8X8KsO0prA4mDiuztX7HZjr0qqSciroPddAGi2qjp
         7jXf+HHtJNg3ejotrKgjqyfweqP3XTdSmCLKg+uzdQS4yRn6qYPvor6Dx09D7GB4u8NG
         BSXrY8iqspP/IUiajMDDspdiXge5I/w3EZ4DwdLNnRme21CsM3cReXvwXkTO2IufQLDL
         nRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OMiXiE1v8IgRSadGW84gcwWEfYoV55Ysd0H2CRvXZ+w=;
        b=gfn1wSLshpU47dnz0lJdj9lvGFud3X6qKtG6+qeqOXqfZAM27bKmKeZ1a7oWl4WYQ0
         znwSzVb4oX0j0NUbvHUhY0berTyG36QkZw8CviG+agQF9x5+2Sx+2OzuNgOeeqlxZyUk
         9LAYipvHq3l9+LpBg9CQOk+CV8MS0Wh5RqBAPPxhO9LZJWPhWOhMNy51AufPgKNz/4g7
         TqPQAJkewiBJzdpOatEjoq9/JKlEYtDek6yIC3KpYvwkO3cQEnnyC8sdnRvDIOw0nhrn
         ozHuwxUK+LKuTDIwzfwPOzGxNY8eX146659CGOKPSxGyeBO3mg+TsshWqUGppCQVJigC
         9UYQ==
X-Gm-Message-State: APjAAAUQC92FFSbW6ihgTxIwPuwm6dRWqNvF1bbK6YwGv6gVFdHYs9wH
        Z0gO47i/pzjhBze9qOcgLiSufpBmTNU5d9PHnNfN9IsDrR0=
X-Google-Smtp-Source: APXvYqwfhtJKHwn/CusahV5vkHhLlP/IO+ThbIt+91Ad7zMa0Tcmcw4FEnXrCvM/mj5zDwR1aGfsAjQRovFlgQwvWRY=
X-Received: by 2002:a1f:ae88:: with SMTP id x130mr3470890vke.79.1569587437087;
 Fri, 27 Sep 2019 05:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kuK6aA1ew9ZY-fVDUE+o71u1QaSg0kfX2jWUWE9Me8Tjg@mail.gmail.com>
In-Reply-To: <CAGm1_kuK6aA1ew9ZY-fVDUE+o71u1QaSg0kfX2jWUWE9Me8Tjg@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Fri, 27 Sep 2019 14:30:22 +0200
Message-ID: <CAGm1_kuQTtyrdwXAV9NCHnvj3f5d7TixmqCPw=Cxd2A=jKSYmg@mail.gmail.com>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when connected
 to musb directly
To:     linux-omap@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, vkoul@kernel.org,
        Bin Liu <b-liu@ti.com>, linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 27, 2019 at 10:18 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> I was porting my system from 3.18/4.2 to 5.3. During this process I
> noticed that FT4232 that is attached directly to musb is not working
> correctly when opened for the first time: tx is working but nothing
> can be received. On the second opening everything is working fine.
> When the same chip is connected via a USB hub - everything is working
> from the very beginning.
>
> I could reproduce this issue using BeagleBone Black with omap2plus_defconfig.
>
> # lsusb -t
> +/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=musb-hdrc/1p, 480M
>     |__ Port 1: Dev 2, If 0, Class=, Driver=ftdi_sio, 480M
>     |__ Port 1: Dev 2, If 1, Class=, Driver=ftdi_sio, 480M
>     |__ Port 1: Dev 2, If 2, Class=, Driver=ftdi_sio, 480M
>     |__ Port 1: Dev 2, If 3, Class=, Driver=ftdi_sio, 480M
>
> git bisect revealed the following:
>
> fdea2d09b997ba4c86e7a707a5fac87c305f2131 is the first bad commit
> commit fdea2d09b997ba4c86e7a707a5fac87c305f2131
> Author: Tony Lindgren <tony@atomide.com>
> Date:   Wed Aug 31 07:19:59 2016 -0700
>
>     dmaengine: cppi41: Add basic PM runtime support
>
>     Let's keep the device enabled between cppi41_dma_issue_pending()
>     and dmaengine_desc_get_callback_invoke() and rely on the PM runtime
>     autoidle timeout elsewhere.
>
>     As the PM runtime is for whole device, not for each channel,
>     we need to queue pending transfers if the device is PM runtime
>     suspended. Then we start the pending transfers in PM runtime
>     resume.
>
>     Signed-off-by: Tony Lindgren <tony@atomide.com>
>     Signed-off-by: Vinod Koul <vinod.koul@intel.com>
>
> :040000 040000 8cf92c09083541dfdee01cc2973e73ef520f4fb1
> a03c1a7ba8e723f7b503733c46edaa4141483265 M      drivers
>
> Any idea?

The problems can be reproduced with other FTDI chips like FT232R.

Invoking "minicom -D /dev/ttyUSB0" and typing some characters is
enough to reproduce the issue (just in case, hw flow control should be
disabled).

cp210x based converter is working without an issue. So only FTDI chips
are affected so far.

Yegor
