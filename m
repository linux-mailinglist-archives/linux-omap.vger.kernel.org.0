Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394BF43E55D
	for <lists+linux-omap@lfdr.de>; Thu, 28 Oct 2021 17:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhJ1Prm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Oct 2021 11:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhJ1Prm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Oct 2021 11:47:42 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563A8C061570
        for <linux-omap@vger.kernel.org>; Thu, 28 Oct 2021 08:45:15 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so9171494ote.8
        for <linux-omap@vger.kernel.org>; Thu, 28 Oct 2021 08:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:cc;
        bh=AT2vVSkbs5Z2AlPH3lVSxISBm4g33VFLgVGD3BjUf+w=;
        b=YyJgDt1mEH4cO9L0C3eZ8WIzZkx77+uNkhgw/PckhjybYjvuvEF/e4Z9pSQZ3PvYxh
         xgRXI47nDvdk0hwf5o1y3VZe59gjTo7x2ldbZmIwaSQqDRsK/Q31tby7qRD4YmSpo+/W
         8JrV7HUbBueSRVJ4t/vLRF1kjYYP2sOK5ZQyLpsIf7ULUvK33CHsUL2ek/93tHmpcrNB
         j9iIO08R3Bnj+lcTX1d7yuF5QPqlNrx4mVfsabehpKLh6c6lmuNonMGu0W8eABm2OZ4M
         cNHuSlDbDNvbl7AUliHafBR+ZLXbFU/fNSktqW/xxdO92aSNXMYS5pSTX5P6ZbKtWLp9
         l4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:cc;
        bh=AT2vVSkbs5Z2AlPH3lVSxISBm4g33VFLgVGD3BjUf+w=;
        b=ABsTiu62YZqyTXlhhp0xmwZWEch401cWF4BYgr4DJVBquhLqSo8MKBpm1kooN0nq5q
         niXjr5zPNuB4H2qFYtCr2pQNR8jb+gouTJro4sA6WQby4MSLdaV9Q4y3mEOwzmfIs3ht
         pPOlf5FT/1aEpwxIW8KELkZE/aFHAPMK3tt8fqOKXonfmfs4gLj0CO+izi4BExUS8Wxv
         1WRJoZle41RXm7C0f0E72j9kwxZCHgcuzmVnyszOgEQzPJH5ssd6UBhyIwuEi0Af4Y5K
         PYQF6Mq7rcpeVBhvCxaaAvm9xIb6j7K/3CzJm3gfpB55tNjT//EQDTERNemEL9j6lVIU
         dClA==
X-Gm-Message-State: AOAM530YvgLW58a/u4JqtOLB37I4Pi8TKgaJU6OowF4S630uODIg++kh
        KVoaIzRHxq9uOnQWxX6bfc0LlrayIKGmWxYCPHQ=
X-Received: by 2002:a05:6830:10d1:: with SMTP id z17mt3487370oto.70.1635435914575;
 Thu, 28 Oct 2021 08:45:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:c04:0:0:0:0:0 with HTTP; Thu, 28 Oct 2021 08:45:14 -0700 (PDT)
Reply-To: israelbarney287@gmail.com
In-Reply-To: <CAA4TxLAyeSCDcVZFoRpW7rgJWnBBciXLvyeaxiGhUf+-11-BYw@mail.gmail.com>
References: <CAA4TxLAMbg3P_juOxMhMgRSf11ycHNowNK108Pgd=1tLLm-w+w@mail.gmail.com>
 <CAA4TxLCmxhnH0Hax3xtyboHQoDviKGMNZscHOn9f2F3atMsV_Q@mail.gmail.com>
 <CAA4TxLBdgbTi89SZqMnVjvd+xnKEnhj73r2vGghMo=kCHLTFOw@mail.gmail.com>
 <CAA4TxLBokA90f8YWm+XWCw9R_MapS2cHVn17RidhHEJn6YiXEg@mail.gmail.com>
 <CAA4TxLD=OOf8S05w2MdEb3BvQjw0nVqi5w4TABWVs8dA45TcvA@mail.gmail.com>
 <CAA4TxLDyitgj3tuuZd=yfy5irFunBGsiF8hAmKF4efiYQ7i2tQ@mail.gmail.com>
 <CAA4TxLCRNk8_OtCYq3Q8MB5jjqVtF3MMLZ+kp6JJ8AcXhFX_QQ@mail.gmail.com>
 <CAA4TxLBE3ag+PsMzf_jJZMJbJ+0hhBsJhm=kADmqCx-sAiMcJQ@mail.gmail.com>
 <CAA4TxLBn_13xcFsHb0Dj87RTqzc7dJMxOfYM6E=S8YPRRxpUmw@mail.gmail.com>
 <CAA4TxLAdOsBq+wuJu9RJYj+XQUJU=xRWAihFPLfUfMxF5WVpmw@mail.gmail.com>
 <CAA4TxLBPa5TkbFXy_DkC+AuMjmU+Mn3K-kYF=6rn9ecLXpvmGA@mail.gmail.com>
 <CAA4TxLDPg22VA+-wBbFgb9pFoYnomDP5X2qLLCXOpv-cN0HXFg@mail.gmail.com>
 <CAA4TxLDpqABNMK175BcVtuSJ+tdW0gxr=NK3VNutfjYTvj1EFg@mail.gmail.com>
 <CAA4TxLAY9PJrz3G16EoM3UkpiXMP08+PAubtukhA8Zt4FEyRRA@mail.gmail.com>
 <CAA4TxLDM6fDFRxMD7fMGk8ntyhuewotY3+o2AhDBQpDZT=3sJw@mail.gmail.com>
 <CAA4TxLDw7_BQ_VLkpXQcgOkgGPV4k+4RrrPoSwELNBeYO9cqKg@mail.gmail.com>
 <CAA4TxLA6a2eWHj2mAfw+Ucucw=FC7CguD8kyXCLh6MePKvSpVw@mail.gmail.com>
 <CAA4TxLDcpo7N-7wM1ZMWpLt8O-nVq7p=U_BXuCFfYaLJe21Dkw@mail.gmail.com>
 <CAA4TxLBS8Y1_RTBt+yUOi5m7QAkJaNCA4m-D33qcgLjsza5=hw@mail.gmail.com>
 <CAA4TxLDS=N7dtE3K2YBkiAeyYTRsKw841xQHgnLitd=6KVz30w@mail.gmail.com>
 <CAA4TxLAb0cuZq6ymVXs-+K9xU-t6zMqYCSjahaUo2ROrhQ1SjQ@mail.gmail.com> <CAA4TxLAyeSCDcVZFoRpW7rgJWnBBciXLvyeaxiGhUf+-11-BYw@mail.gmail.com>
From:   israel barney <kristengriest098@gmail.com>
Date:   Thu, 28 Oct 2021 16:45:14 +0100
Message-ID: <CAA4TxLBHsZu3FneDQna2kqetvYCGqaJaJWEe0ge+gqb6d0hhZw@mail.gmail.com>
Subject: Greetings
Cc:     israelbarney287@gmail.com
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

do you receive my massage
