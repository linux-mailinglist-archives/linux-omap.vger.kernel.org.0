Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 460B1102AD1
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 18:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbfKSRbT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 12:31:19 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:39169 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728060AbfKSRbS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 12:31:18 -0500
Received: by mail-io1-f65.google.com with SMTP id k1so24157964ioj.6
        for <linux-omap@vger.kernel.org>; Tue, 19 Nov 2019 09:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZKXb08mLw7/gYPbvXLPbBkWtw4UGYUMyffgZIZI+HT0=;
        b=ArmFHtCFR79K59IBtCbRQ9YtpK4dcS1SQ2DILybT8VpuW5oSI+0/OjIkU1lxFXj90/
         g67wwarVmSXF/YEiLI36TyOFoIjfqE27lCCfVjunx2J7PwQuhJWt3gDvFtjUCpYKxgh9
         oVBJkz7zllCUtHe+zYEkA35bMlpX/+bt76IY68FDbH/jA6+he9MBGIXzPgjDy2onhxbt
         MmWvCZG+IUqmlnJ/v5MdvtENnsgyvXm6+Q+U4kXbHucQ25VneEvlZXYpMb/i6Pwua1OF
         iBgGyPJ+pmIvLIBTRt8nvMFDyfyP6H8g7fFrfjUeeOMyL36jz0L55jJ7g10/Y6oDX1NK
         nTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZKXb08mLw7/gYPbvXLPbBkWtw4UGYUMyffgZIZI+HT0=;
        b=anH8G/M9prWcvviMty/OH6BzPLbI0X1vapWJbBzAC1JNCWCipSSmuQXt9e7YHy0NYL
         414o1o3aVRF7/8E+q9cR7Up42Wc6Q8R+aIlVm5fTRk151HvEeISrxgTBfAWICyzOz05d
         OjFjnuOz6uo/Lsyl7NJjW5fjViHjZKCtmRuoHMY177buuJvaLCjmqdhn2hzHj+ESmnOo
         rYuY1G0m9QRGJ2HB7AtZREsry4ykf+f/I+R8C7AL95bImanmx3GLIfeqscBFVy6olCK9
         izmHqaf+ZTIJZjNUP50wJ+gnejgZgaf84vSDytOKpeV1m9Z+4vtDMx1y9NWGOTUUUgHu
         VC0A==
X-Gm-Message-State: APjAAAXLr2hE7gDw9EK6O53sNrO2MEo6FzkbrawuU1g3gp6QUQT6Fl3g
        xgdD7Or/n6A3xZb6cNpLx5SVqRmNEj7knR8NmxQ4SA==
X-Google-Smtp-Source: APXvYqxuSx88S96OihGrrKgtsaBcR+slNCHyQEu+C35JJbv7CvdH9n0vVrz2XW8a5TUK1UWZLn2OBnY3pHUXCiSjiq8=
X-Received: by 2002:a6b:14ca:: with SMTP id 193mr19398156iou.140.1574184677951;
 Tue, 19 Nov 2019 09:31:17 -0800 (PST)
MIME-Version: 1.0
References: <20191119141645.19777-1-t-kristo@ti.com>
In-Reply-To: <20191119141645.19777-1-t-kristo@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 19 Nov 2019 10:31:06 -0700
Message-ID: <CANLsYkwyLMHzKkm-6X+OgQ+khRYJshMJsxdst7+c7n+hX4nLpQ@mail.gmail.com>
Subject: Re: [PATCHv2 00/15] Remoteproc: updates for OMAP remoteproc support
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 19 Nov 2019 at 07:17, Tero Kristo <t-kristo@ti.com> wrote:
>
> Hi,
>
> This is v2 of the series [1], addressing comments from Bjorn and Rob.
> Bindings patch is funnily v2.5, as I posted v2 already and wanted to
> keep this somehow in sync. Individual patches contain comments about the
> changes, or Reviewed-by tags provided if there are no changes.
>
> I also dropped the conversion patch to SPDX licensing until I can
> confirm the license we want to use. Lets just keep the existing in place
> until that.
>
> This series still depends on the reset + clock patches posted earlier,
> but both of those dependencies are in linux-next now.

I tried to apply your set to today's linux-next (next-20191119) but it
fails at patch 13.

Mathieu

>
> -Tero
>
> [1] https://patchwork.kernel.org/cover/11215421/
>
>
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
