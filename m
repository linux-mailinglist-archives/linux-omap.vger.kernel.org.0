Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCD968D517
	for <lists+linux-omap@lfdr.de>; Tue,  7 Feb 2023 12:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjBGLGb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Feb 2023 06:06:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbjBGLG3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Feb 2023 06:06:29 -0500
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1128F13DC2
        for <linux-omap@vger.kernel.org>; Tue,  7 Feb 2023 03:06:28 -0800 (PST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-16a8d511ce0so39687fac.1
        for <linux-omap@vger.kernel.org>; Tue, 07 Feb 2023 03:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=52pQ4ry0LUmXlUqqJU+hhNA5UvWOgSZ0ZDQ1upN22Fs=;
        b=bF8GsCq4baq/kh1m2ojvE3FRFgaqlcGhZy/GjxWFsjrtSq6sPV45R7d+9X7LKrMm3c
         NlNrW+zSDrqTwZUJ1j3vqqEvbSPdD/GCMvCwFhRabb2JzG1/93W/K1kFIUeREAdHPdiO
         dAIuyhpFfLnrvEXldZsPhrRVXiay5s/iI00Zby/EhlORCi5tO3eN/3vxUROLEcudItwq
         k0hlI0W3kQ+JJvdxfTT8OZ5o4jkylB+YjinoClYv1s0zJlHbtboatvgnF11ZdWmhbt6i
         PHKkiosNOLy7s3m0jqu4ghXyv78jtcAImGwph1/TtzZEJbRksutVC8/0KAPdLEPtWr3P
         lizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=52pQ4ry0LUmXlUqqJU+hhNA5UvWOgSZ0ZDQ1upN22Fs=;
        b=gA6mEVanbkjsOCoYL/ZHB8cy1xfJlxlrTail4hAQ+EcVfDRdHAPiZ5rjZmwAVzRTfc
         7PmRAxw7GilI/Sl5kU/DiyQUj1KmJtkXlmj6/YuxSKf4Xk4DllyxF9X1lAFS+7hgTBbM
         3zWXgXJqtmqSQvzpPJ0NgTwZGgT6buSJV22Kw2CGsIVmuWlsDF1+WN6ekHuF3/t7cRjO
         WnEoH/LOvddxdiP/eFH4KuZvbVTmZ1mInw5UCG7PT21faMFB0nsmXZ9vJSk8mRUIctQG
         K0OmGGgYWSSSMGgWcN3QwBEn4PXUR0hEFGARGQe6J7GUh2WkZWx+EoFskopeDCygmNdG
         Gykg==
X-Gm-Message-State: AO0yUKWk8PS8B+ZPogvd0EMxIAsiZkDU3Aet+WyJo662jNotO7xbYwWi
        cGbTBz/4PG7bh4BSUMLJhhPhNrzZm/CCYuLSYSk=
X-Google-Smtp-Source: AK7set8XIJW3+dL4AAC14VpZkD0VZpn1VyJXE5XmcQ/ePGLVfMtjnjntDwT//Yp1ZRyhazs58DUCuQ5aJUXYvMfmJm4=
X-Received: by 2002:a05:6871:72c:b0:16a:24a7:28ab with SMTP id
 f44-20020a056871072c00b0016a24a728abmr497406oap.125.1675767988239; Tue, 07
 Feb 2023 03:06:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6358:50c7:b0:ea:cdc1:9aff with HTTP; Tue, 7 Feb 2023
 03:06:27 -0800 (PST)
From:   DAVID KARL <info.davidkarl1959@gmail.com>
Date:   Tue, 7 Feb 2023 12:06:27 +0100
Message-ID: <CAH7gjpxr2fbLASgigD-cPg5CFuKO4zLXDRBgQ9MVGK37d36wCA@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Dear
Good morning, Did you receive my message my message i sent to you
yesterday, It is very urgent you reverse back as soon as possible.
Karl
